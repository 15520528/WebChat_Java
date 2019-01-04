/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.webchat;

import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import org.redisson.Redisson;
import org.redisson.api.RMapCache;
import org.redisson.api.RReadWriteLock;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;

public class test {

    public static void main(String[] args) throws ExecutionException {
//        CacheLoader<String, String> loader;
//        loader = new CacheLoader<String, String>() {
//            @Override
//            public String load(String key) {
//                return key.toUpperCase();
//            }
//        };
//        LoadingCache<String, String> cache;
//        cache = CacheBuilder.newBuilder().maximumSize(3).build(loader);
//        cache.put("1", "m");
//        cache.put("2", "ASDÁD");
//        cache.put("3", "ÁD");
//        cache.put("4", "ÁDASD");
//        cache.put("4", "ÁD");
//        LinkedHashMap<String, String> orderedMap = new LinkedHashMap<>();
//        synchronized (orderedMap) {
//            Map<String, String> m= cache.asMap();
//            for (Entry<String, String> entry : m.entrySet()) {
//                String key = entry.getKey();
//                String value = entry.getValue();
//                System.out.println;
//            }
//        }

//        RedissonClient redisson = Redisson.create();
//        
//        RMapCache<String, String> mapCache = redisson.getMapCache("1");
//       
//        RReadWriteLock rwlock = redisson.getReadWriteLock("anyRWLock");
       // mapCache.clear();
        //rwlock.readLock().lock(10, TimeUnit.SECONDS);
//         Integer prevValue = mapCache.put("1", 10);
//        // with ttl = 15 seconds and maxIdleTime = 5 seconds
//        Integer prevValue2 = mapCache.put("2", 20);
//        // store value permanently 
//        Integer prevValue3 = mapCache.put("3", 30);
        
        //rwlock.readLock().unlock();
//        Set<Entry<String, String>> allEntries = mapCache.readAllEntrySet();
//       
//        
//        for (Entry<String, String> entry : allEntries) {
//            String key = entry.getKey();
//            String value = entry.getValue();
//            System.out.println(key+" "+value);
//        }
//        
        RedissonClient redisson = Redisson.create();
        RMapCache<String, String> map = redisson.getMapCache("1");
//        map.clear();
//        map.setMaxSize(5);
//        map.put("1", "mot");
//        map.put("2", "hai");
//        map.put("3", "3");
//        map.put("4", "bon");
//        map.put("5", "bon");
//        map.put("6", "bon");
//        map.put("7", "bon");
        Set<Map.Entry<String, String>> allEntries = map.readAllEntrySet();


        for (Map.Entry<String, String> entry : allEntries) {
            String key = entry.getKey();
            String value = entry.getValue();
            System.out.println(key+" "+value);
        }    
        System.out.println(System.currentTimeMillis());
    }
}
