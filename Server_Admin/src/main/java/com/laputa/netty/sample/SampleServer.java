package com.laputa.netty.sample;

import com.laputa.netty.AppConfig;
import com.laputa.netty.BootServer;
import com.laputa.netty.Server;
import com.laputa.netty.utils.DefConfigFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * 基于spring注解的sampleServer
 * User: Dempe
 * Date: 2016/1/28
 * Time: 15:41
 * To change this template use File | Settings | File Templates.
 */
@Configuration
@ComponentScan
public class SampleServer {

    public static void main(String[] args) {
        // 启动spring容器
        ApplicationContext context = new AnnotationConfigApplicationContext(SampleServer.class);
        // 生成开发环境的配置
        AppConfig devConfig = DefConfigFactory.createDEVConfig();
        Server server = new BootServer(devConfig, context);
        server.start();
    }
}
