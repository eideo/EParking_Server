package com.laputa.netty.sample;

import com.laputa.netty.client.CommonClient;
import com.laputa.netty.client.Future;
import com.laputa.netty.proto.Request;
import com.laputa.netty.proto.Response;
import com.laputa.netty.utils.MetricThread;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 简单client示例
 * User: Dempe
 * Date: 2016/1/28
 * Time: 15:43
 * To change this template use File | Settings | File Templates.
 */
public class SampleClient {

    public static void main(String[] args) throws Exception {
        futureClientExample();
    }

    /**
     * FutureClient example
     * @throws Exception
     */
    public static void futureClientExample() throws Exception {
        CommonClient client = new CommonClient("localhost", 8888);
        // 构造json请求协议
        Request request = buildRequest();
        Future<Response> future = client.send(request);
        System.out.println(future.await());
    }

    /**
     * BlockingClient example
     * @throws Exception
     */
//    public static void blockingClientExample() throws Exception {
//        BlockingClient client = new BlockingClient("localhost", 8888);
//        Request request = buildRequest();
//        Response response = client.send(request);
//        System.out.println(response);
//    }

    /**
     * CallbackClient example
     * @throws Exception
     */
//    public static void callbackClientExample() throws Exception {
//        CallbackClient client = new CallbackClient("localhost", 8888);
//        Request request = buildRequest();
//        client.send(request, new Callback() {
//            @Override
//            public void onReceive(Object message) {
//                System.out.println(message);
//            }
//        });
//    }

    public static Request buildRequest() {
        Map<String, String> data = new HashMap<String, String>();
        data.put("name", "dempe");
        data.put("age", "1");
        Request request = new Request();
        request.setUri("/sample/hello");
        request.setParamMap(data);
        return request;
    }


    /**
     * 压测方法
     * @throws Exception
     */
    public static void stressTesting() throws Exception {
        MetricThread thread = new MetricThread("client");
        List<CommonClient> clientList = new ArrayList<CommonClient>();
        int size = 8;
        for (int i = 0; i < size; i++) {
            clientList.add(new CommonClient("localhost", 8888));
        }
        int i = 0;
        while (true) {
            i++;
            thread.increment();
            CommonClient client = clientList.get(i % size);
            // 初始化client
            Request request = buildRequest();
            //发送请求并返回响应
            Future<Response> future = client.send(request);
            if (i % 100000 == 0) {
                TimeUnit.SECONDS.sleep(1);
            }
        }
    }



}
