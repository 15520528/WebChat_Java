package chat;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.*;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.handler.codec.http.DefaultHttpRequest;
import io.netty.handler.codec.http.HttpHeaderNames;
import io.netty.handler.codec.http.HttpHeaders;
import io.netty.handler.codec.http.HttpRequest;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketServerHandshaker;
import io.netty.handler.codec.http.websocketx.WebSocketServerHandshakerFactory;
import io.netty.util.CharsetUtil;
import io.netty.util.concurrent.GlobalEventExecutor;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.concurrent.*;

import java.util.Set;
import java.util.Map.Entry;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import org.redisson.Redisson;
import org.redisson.api.RMapCache;
import org.redisson.api.RReadWriteLock;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;

public class DiscardServerHandler extends SimpleChannelInboundHandler<String> {

    //save client's channel connect to server
    private static final ChannelGroup channels = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);

    //save conversation_id (key) and coressonding channels 
    private static final ConcurrentHashMap<String, ChannelGroup> Participants = new ConcurrentHashMap();

    //memcache message
    private static final RedissonClient redisson = Redisson.create();

    WebSocketServerHandshaker handshaker;

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) {
        if (msg instanceof TextWebSocketFrame) {
            System.out.println(((TextWebSocketFrame) msg).text());
            String header = ((TextWebSocketFrame) msg).text();

            //convert json mgessage into json object
            JsonObject jsonObject = new JsonParser().parse(header).getAsJsonObject();

            String command = jsonObject.get("command").getAsString();
            //if first request then add channel to conversation
            if (command.equalsIgnoreCase("getDetailConversations")) {
                System.out.println("not contain");
                //System.out.println(jsonObject.get("Conversation_ids").getAsString());
                //add client's channel to groupChannel -> send message distinct
                StringBuilder JsonString = new StringBuilder();
                JsonString.append("{ \"command\":\"detailConversations\",\n"
                        + "  \"detailsConversations\":[");
                for (JsonElement value : jsonObject.get("Conversation_ids").getAsJsonArray()) {
                    System.out.println(value.getAsString());
                    String Id = value.getAsString();

                    if (!Participants.containsKey(Id)) {
                        //put first client's channel into concertnedChannels
                        ChannelGroup concernedChannels = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);
                        concernedChannels.add(ctx.channel());
                        Participants.put(Id, concernedChannels);
                    } else {
                        //add another channel in to correct Id conversation 
                        Participants.get(Id).add(ctx.channel());
                    }
                    RMapCache<String, String> map = redisson.getMapCache(Id);
                    //get all values inside mapcache Id
                    Set<Map.Entry<String, String>> allEntries = map.readAllEntrySet();

                    JsonString.append("{ \"conversation_id\" : \"").append(Id).append("\",");
                    JsonString.append("\"messages\":[");
                    for (Map.Entry<String, String> entry : allEntries) {
                        String sender = entry.getKey();
                        String message = entry.getValue();
                        JsonString.append("{\"sender\":\"").append(sender).append("\",");
                        JsonString.append("\"message\":\"").append(message).append("\"},");
                    }
                    if (allEntries.size() == 0) {
                        JsonString.append("[");
                    }
                    JsonString.deleteCharAt(JsonString.length() - 1);
                    JsonString.append("]},");

                }
                JsonString.deleteCharAt(JsonString.length() - 1);
                JsonString.append("]}");
                System.out.println(JsonString.toString());

                //send all detail conversations to client
                ctx.writeAndFlush(new TextWebSocketFrame(JsonString.toString()));
                
                System.out.println(channels.size());
                for (Map.Entry<String, ChannelGroup> entry : Participants.entrySet()) {
                    String key = entry.getKey();
                    System.out.println(key + " size: " + entry.getValue().size());
                }
            } else if (command.equalsIgnoreCase("sendMessage")) {
                System.out.println("contain");
                String Id = jsonObject.get("Conversation_id").getAsString();
                String message = jsonObject.get("message").getAsString();
                String sender = jsonObject.get("sender").getAsString();
                //save message to memcache
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
                LocalDateTime now = LocalDateTime.now();

                RReadWriteLock rwlock = redisson.getReadWriteLock("anyRWLock");

                rwlock.writeLock().lock();

                RMapCache<String, String> mapCache = redisson.getMapCache(Id);
                mapCache.setMaxSize(5);
                mapCache.put(sender + "/" + System.currentTimeMillis(), message);

                rwlock.writeLock().unlock();

                //send message to  participants in Conversation
                for (Channel c : Participants.get(Id)) {
                    if (c != ctx.channel()) {
                        c.writeAndFlush(new TextWebSocketFrame(
                                "{\"command\":\"detailMessage\",\"message\":{\"sender\":\"" + sender + "\",\"Conversation_id\": \"" + Id + "\", \"message\":\"" + message + "\"}}\n"));
                    } else {
                        c.writeAndFlush(new TextWebSocketFrame(
                                "{\"command\":\"detailMessage\",\"message\":{\"sender\":\"you\", \"Conversation_id\": \"" + Id + "\", \"message\":\"" + message + "\"}}\n"));
                        //c.writeAndFlush(new TextWebSocketFrame("[you] " + ((TextWebSocketFrame) msg).text() + '\n'));
                    }
                }
                return;
            } else if (command.equalsIgnoreCase("sendMessage")) {

            }
        }
        DefaultHttpRequest httpRequest = null;
        if (msg instanceof DefaultHttpRequest) {
            httpRequest = (DefaultHttpRequest) msg;

            // Handshake
            WebSocketServerHandshakerFactory wsFactory = new WebSocketServerHandshakerFactory("ws://127.0.0.1:8081/", null, false);
            final Channel channel = ctx.channel();
            final WebSocketServerHandshaker handshaker = wsFactory.newHandshaker(httpRequest);

            if (handshaker == null) {

            } else {
                ChannelFuture handshake = handshaker.handshake(channel, httpRequest);
            }
        }
    }

    @Override
    public void channelRead0(ChannelHandlerContext ctx, String msg) throws Exception {
        TextWebSocketFrame frame = new TextWebSocketFrame(msg);
        System.out.println(frame.text());
        for (Channel c : channels) {
            if (c != ctx.channel()) {
                c.writeAndFlush("[" + ctx.channel().remoteAddress() + "] " + msg + '\n');
            } else {
                c.writeAndFlush("[you] " + msg + '\n');
            }
        }
    }

    //client session joined into this chat
    @Override
    public void handlerAdded(ChannelHandlerContext ctx) {
        channels.add(ctx.channel());
        System.out.println("đm 1 thằng client đã tham gia >< ");
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) { // (4)
        // Close the connection when an exception is raised.
        cause.printStackTrace();
        ctx.close();
    }
}

