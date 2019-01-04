<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<jsp:include page="_header.jsp"></jsp:include>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>      
            <!--            <script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
                        <script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
                        <script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'>-->

        </script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/emilcarlsson/pen/ZOQZaV?limit=all&page=74&q=contact+" />
        <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300' rel='stylesheet' type='text/css'>

        <script src="https://use.typekit.net/hoy3lrg.js"></script>
        <script>try {
                Typekit.load({async: true});
            } catch (e) {
            }</script>
        <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'><link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
        <link rel="stylesheet" href="css/index.css">
        <style class="cp-pen-styles">body {
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                background: #27ae60;
                font-family: "proxima-nova", "Source Sans Pro", sans-serif;
                font-size: 1em;
                letter-spacing: 0.1px;
                color: #32465a;
                text-rendering: optimizeLegibility;
                text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.004);
                -webkit-font-smoothing: antialiased;
            }
        </style>
    </head> 
    <body>
        <div id="frame">
            <div id="sidepanel">
                <div id="profile">
                    <div class="wrap">
                        <img id="profile-img" src="http://emilcarlsson.se/assets/mikeross.png" class="online" alt="" />
                        <p id="username">${user.userName}</p>
                    <i class="fa fa-chevron-down expand-button" aria-hidden="true"></i>
                    <div id="status-options">
                        <ul>
                            <li id="status-online" class="active"><span class="status-circle"></span> <p>Online</p></li>
                            <li id="status-away"><span class="status-circle"></span> <p>Away</p></li>
                            <li id="status-busy"><span class="status-circle"></span> <p>Busy</p></li>
                            <li id="status-offline"><span class="status-circle"></span> <p>Offline</p></li>
                        </ul>
                    </div>
                    <div id="expanded">
                        <label for="twitter"><i class="fa fa-facebook fa-fw" aria-hidden="true"></i></label>
                        <input name="twitter" type="text" value="mikeross" />
                        <label for="twitter"><i class="fa fa-twitter fa-fw" aria-hidden="true"></i></label>
                        <input name="twitter" type="text" value="ross81" />
                        <label for="twitter"><i class="fa fa-instagram fa-fw" aria-hidden="true"></i></label>
                        <input name="twitter" type="text" value="mike.ross" />
                    </div>
                </div>
            </div>
            <div id="search">
                <label for=""><i class="fa fa-search" aria-hidden="true"></i></label>
                <input type="text" placeholder="Search contacts..." />
            </div>
            <div id="contacts">
                <ul>
                    <!--                    <li class="contact">
                                            <div class="wrap">
                                                <span class="contact-status online"></span>
                                                <img src="http://emilcarlsson.se/assets/louislitt.png" alt="" />
                                                <div class="meta">
                                                    <p class="name">Louis Litt</p>
                                                    <p class="preview">You just got LITT up, Mike.</p>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="contact active">
                                            <div class="wrap">
                                                <span class="contact-status busy"></span>
                                                <img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
                                                <div class="meta">
                                                    <p class="name">Harvey Specter</p>
                                                    <p class="preview">Wrong. You take the gun, or you pull out a bigger one. Or, you call their bluff. Or, you do any one of a hundred and forty six other things.</p>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="contact">
                                            <div class="wrap">
                                                <span class="contact-status away"></span>
                                                <img src="http://emilcarlsson.se/assets/rachelzane.png" alt="" />
                                                <div class="meta">
                                                    <p class="name">Rachel Zane</p>
                                                    <p class="preview">I was thinking that we could have chicken tonight, sounds good?</p>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="contact">
                                            <div class="wrap">
                                                <span class="contact-status online"></span>
                                                <img src="http://emilcarlsson.se/assets/donnapaulsen.png" alt="" />
                                                <div class="meta">
                                                    <p class="name">Donna Paulsen</p>
                                                    <p class="preview">Mike, I know everything! I'm Donna..</p>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="contact">
                                            <div class="wrap">
                                                <span class="contact-status busy"></span>
                                                <img src="http://emilcarlsson.se/assets/jessicapearson.png" alt="" />
                                                <div class="meta">
                                                    <p class="name">Jessica Pearson</p>
                                                    <p class="preview">Have you finished the draft on the Hinsenburg deal?</p>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="contact">
                                            <div class="wrap">
                                                <span class="contact-status"></span>
                                                <img src="http://emilcarlsson.se/assets/haroldgunderson.png" alt="" />
                                                <div class="meta">
                                                    <p class="name">Harold Gunderson</p>
                                                    <p class="preview">Thanks Mike! :)</p>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="contact">
                                            <div class="wrap">
                                                <span class="contact-status"></span>
                                                <img src="http://emilcarlsson.se/assets/danielhardman.png" alt="" />
                                                <div class="meta">
                                                    <p class="name">Daniel Hardman</p>
                                                    <p class="preview">We'll meet again, Mike. Tell Jessica I said 'Hi'.</p>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="contact">
                                            <div class="wrap">
                                                <span class="contact-status busy"></span>
                                                <img src="http://emilcarlsson.se/assets/katrinabennett.png" alt="" />
                                                <div class="meta">
                                                    <p class="name">Katrina Bennett</p>
                                                    <p class="preview">I've sent you the files for the Garrett trial.</p>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="contact">
                                            <div class="wrap">
                                                <span class="contact-status"></span>
                                                <img src="http://emilcarlsson.se/assets/charlesforstman.png" alt="" />
                                                <div class="meta">
                                                    <p class="name">Charles Forstman</p>
                                                    <p class="preview">Mike, this isn't over.</p>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="contact">
                                            <div class="wrap">
                                                <span class="contact-status"></span>
                                                <img src="http://emilcarlsson.se/assets/jonathansidwell.png" alt="" />
                                                <div class="meta">
                                                    <p class="name">Jonathan Sidwell</p>
                                                    <p class="preview"><span>You:</span> That's bullshit. This deal is solid.</p>
                                                </div>
                                            </div>
                                        </li>-->
                </ul>
            </div>
            <div id="bottom-bar">
                <button id="addcontact"><i class="fa fa-user-plus fa-fw" aria-hidden="true"></i> <span>Add contact</span></button>
                <button id="settings"><i class="fa fa-cog fa-fw" aria-hidden="true"></i> <span>Settings</span></button>
            </div>
        </div>
        <div class="content" id="Content97">
            <div class="contact-profile">
                <img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
                <p>Harvey Specter</p>
                <div class="social-media">
                    <i class="fa fa-facebook" aria-hidden="true"></i>
                    <i class="fa fa-twitter" aria-hidden="true"></i>
                    <i class="fa fa-instagram" aria-hidden="true"></i>
                </div>
            </div>
            <div class="messages" id="Lmessages">
                <ul class="list" id="L1">
                    <li class="sent">
                        <img src="http://emilcarlsson.se/assets/mikeross.png" alt="" />
                        <p>How the hell am I supposed to get a jury to believe you when I am not even sure that I do?!</p>
                    </li>
                    <li class="replies">
                        <img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
                        <p>When you're backed against the wall, break the god damn thing down.</p>
                    </li>
                    <li class="replies">
                        <img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
                        <p>Excuses don't win championships.</p>
                    </li>
                    <li class="sent">
                        <img src="http://emilcarlsson.se/assets/mikeross.png" alt="" />
                        <p>Oh yeah, did Michael Jordan tell you that?</p>
                    </li>
                    <li class="replies">
                        <img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
                        <p>No, I told him that.</p>
                    </li>
                    <li class="replies">
                        <img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
                        <p>What are your choices when someone puts a gun to your head?</p>
                    </li>
                    <li class="sent">
                        <img src="http://emilcarlsson.se/assets/mikeross.png" alt="" />
                        <p>What are you talking about? You do what they say or they shoot you.</p>
                    </li>
                    <li class="replies">
                        <img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
                        <p>Wrong. You take the gun, or you pull out a bigger one. Or, you call their bluff. Or, you do any one of a hundred and forty six other things.</p>
                    </li>
                </ul>
            </div>
            <div class="message-input">
                <div class="wrap">
                    <input type="text" placeholder="Write your message..." />
                    <i class="fa fa-paperclip attachment" aria-hidden="true"></i>
                    <button class="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                </div>
            </div>
            <p id="ConversationId" style='visibility: visible;'></p>
        </div>
    </div>
    <!--<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>-->
    <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<sctipt src='css/chatDasboard.js'></sctipt>
<script >
            (function ($) {
                $(".messages").animate({scrollTop: $(document).height()}, "fast");

                $("#profile-img").click(function () {
                    $("#status-options").toggleClass("active");
                });

                $(".expand-button").click(function () {
                    $("#profile").toggleClass("expanded");
                    $("#contacts").toggleClass("expanded");
                });

                //connect socket to localhost 8081
                var ws;
                ws = new WebSocket("ws://localhost:8081/WebChat/chatRoomServer/Nam");
                ws.onmessage = function (event) {
                    console.log(event.data);
                    //var message = JSON.parse(event.data);

                    var obj = JSON.parse(event.data);
                    console.log();
                    if (obj.command == "detailMessage") {
                        var obj2 = obj.message;
                        var sender = obj2.sender;
                        var message = obj2.message;
                        var conversation_id = obj2.Conversation_id;
//                        console.log(sender+" " + message + " "+conversation_id);
                        if (sender != "you") {
                            $('<li ><p style="color:#f291ff; float:right;">' + sender + '</p></li>').appendTo($('#L' + conversation_id));
                            $('<li class="replies"><img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" /><p>' + message + '</p></li>').appendTo($('#L' + conversation_id));
                            $('.contact.active .preview').html('<span>You: </span>' + message);
                            var element = document.getElementById("Lmessages");
                            $(".messages").animate({scrollTop: element.scrollHeight}, "fast");
                        }
                    } else if (obj.command == "detailConversations") {
                        var obj2 = obj.detailsConversations;
                        console.log(obj2.length);
                        for (var i = 0; i < obj2.length; i++) {
                            //console.log(obj2[i].conversation_id);
                            var conversation_id = obj2[i].conversation_id;
                            for (var j = 0; j < obj2[i].messages.length; j++) {
                                //console.log(obj2[i].messages[j].sender);
                                var sender = obj2[i].messages[j].sender;
                                
                                var arrOfStr = sender.split("/", -2);
                                
                                sender = arrOfStr[0];
                                var d = new Date(parseInt(arrOfStr[1]));
                                //console.log(d.toLocaleString());

                                var message = obj2[i].messages[j].message;
                                if (sender != "${user.userName}") {

                                    $('<li ><p style="color:#f291ff; float:right;">' + sender + '</p></li>').appendTo($('#L' + conversation_id));
                                    $('<li class="replies"><img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" /><p>' + message + '</p></li>').appendTo($('#L' + conversation_id));
                                    $('.contact.active .preview').html('<span>You: </span>' + message);
                                    var element = document.getElementById("Lmessages");
                                    $(".messages").animate({scrollTop: element.scrollHeight}, "fast");
                                } else if (sender == "${user.userName}") {
                                    $('<li ><p style="color:#f291ff; float:left;">' + sender + '</p></li>').appendTo($('#L' + conversation_id));
                                    $('<li class="sent"><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>' + message + '</p></li>').appendTo($('#L' + conversation_id));
                                    $('.contact.active .preview').html('<span>You: </span>' + message);
                                    var element = document.getElementById("Lmessages");
                                    $(".messages").animate({scrollTop: element.scrollHeight}, "fast");
                                }

                            }
                        }
                    }
                };

                //current conversation id
                var currentConversationId;
                var idConversationArrays = [];

                //get all conversation title
                var user_id = '${userid}';
                var url = "ViewConversation?userId=" + user_id;


                ws.onopen = function () {
                    $.ajax({
                        url: url,
                        cache: false,
                        type: "get",
                        success: function (html) {
                            var arrayOfObjects = eval("[" + html + "]");
                            var firstId = -1;
                            $(jQuery.parseJSON(JSON.stringify(arrayOfObjects))).each(function () {
                                var ID = this.Id;
                                var TITLE = this.Title;
                                idConversationArrays.push(ID);

                                if (firstId == -1) {
                                    firstId = ID;
                                }
                                $('<li class="contact" onclick="viewConversation()">' +
                                        '<div class="wrap">' +
                                        '   <span class="contact-status"></span>' +
                                        '  <img src="http://emilcarlsson.se/assets/haroldgunderson.png" alt="" />' +
                                        ' <div class="meta">' +
                                        '    <p class="name" id="' + ID + '">' + TITLE + '</p>' +
                                        '   <p class="preview">Thanks Mike! :)</p>' +
                                        '</div>' +
                                        '</div>' +
                                        '</li>').on("click", viewConversation).appendTo($('#contacts ul'));

                                $('<ul class="list" id="L' + ID + '"><li class="sent"></li></ul>').appendTo($('#Lmessages'));
                            });

                            //show content of the first conversation
                            $("#ConversationId").val(firstId);
                            $(".list").hide();
                            $('#L' + firstId).show();

                            //socket send conversationIds of client
                            var json = JSON.stringify({
                                "isFirstRequest": "1",
                                "Conversation_ids": idConversationArrays,
                                "command": "getDetailConversations"
                            });
//                            alert(json);
                            ws.send(json);
                        }
                    });
                }
                function viewConversation() {
                    $("#ConversationId").val($(this).find("p.name:first").attr('id'));
                    var id = $(this).find("p.name:first").attr('id');
                    if (!$('#L' + id).length) {
                        $('<ul class="list" id="L' + id + '"><li class="sent"></li></ul>').appendTo($('#Lmessages'));
                        //$(".list").hide();
                        //$('#'+id).show();
                    }
                    $(".list").hide();
                    $('#L' + id).show();

                }


                $("#status-options ul li").click(function () {
                    $("#profile-img").removeClass();
                    $("#status-online").removeClass("active");
                    $("#status-away").removeClass("active");
                    $("#status-busy").removeClass("active");
                    $("#status-offline").removeClass("active");
                    $(this).addClass("active");

                    if ($("#status-online").hasClass("active")) {
                        $("#profile-img").addClass("online");
                    } else if ($("#status-away").hasClass("active")) {
                        $("#profile-img").addClass("away");
                    } else if ($("#status-busy").hasClass("active")) {
                        $("#profile-img").addClass("busy");
                    } else if ($("#status-offline").hasClass("active")) {
                        $("#profile-img").addClass("offline");
                    } else {
                        $("#profile-img").removeClass();
                    }
                    ;

                    $("#status-options").removeClass("active");
                });

                //send message to server
                function newMessage() {
                    message = $(".message-input input").val();
                    if ($.trim(message) == '') {
                        return false;
                    }

                    $('<li ><p style="color:#f291ff;">${user.userName}</p></li>').appendTo($('#L' + $("#ConversationId").val()));
                    $('<li class="sent"><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>' + message + '</p></li>').appendTo($('#L' + $("#ConversationId").val()));
                    $('.message-input input').val(null);
                    $('.contact.active .preview').html('<span>You: </span>' + message);
                    var element = document.getElementById("Lmessages");
                    $(".messages").animate({scrollTop: element.scrollHeight}, "fast");

//                    $('<li class="replies"><img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" /><p>' + message + '</p></li>').appendTo($('.messages ul'));
//                    $('.message-input input').val(null);
//                    $('.contact.active .preview').html('<span>You: </span>' + message);
//                    var element = document.getElementById("99");
//                    $(".messages").animate({scrollTop: element.scrollHeight}, "fast");

                    //send message
                    Id = $("#ConversationId").val();
                    //alert(Id);
                    var json = JSON.stringify({
                        "isFirstRequest": "0",
                        "sender": "${user.userName}",
                        "Conversation_id": Id,
                        "message": message,
                        "command": "sendMessage"
                    });
                    ws.send(json);
                }


                $('.submit').click(function () {
                    newMessage();
                });

                $(window).on('keydown', function (e) {
                    if (e.which == 13) {
                        newMessage();
                        return false;
                    }
                });

            }(jQuery));
            //# sourceURL=pen.js
</script>
</body>
</html>
