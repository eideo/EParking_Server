package com.laputa.gps;

import com.laputa.gps.messages.Decoder;
import com.laputa.gps.messages.Encoder;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;
import io.netty.util.concurrent.Future;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.net.InetSocketAddress;

@WebListener
public class ServerInitializer implements ServletContextListener {
    EventLoopGroup bossGroup = new NioEventLoopGroup(1);
    EventLoopGroup workerGroup = new NioEventLoopGroup();
    Log log = LogFactory.getLog(ServerInitializer.class);
    int port = 9012;


    public void contextInitialized(ServletContextEvent sce) {
        log.info("netty initialization run");
        ServerBootstrap b = new ServerBootstrap();
        log.info("GPS socket is running at port:" + port);
        b.group(bossGroup, workerGroup)
                .channel(NioServerSocketChannel.class)
                .handler(new LoggingHandler(LogLevel.INFO))
                .option(ChannelOption.TCP_NODELAY,true)
                .option(ChannelOption.SO_KEEPALIVE, true)

                .childHandler(new ChannelInitializer() {
                    @Override
                    protected void initChannel(Channel channel) throws Exception {
                        ChannelPipeline pipeline = channel.pipeline();
// Enable stream compression (you can remove these two if unnecessary)
                        //  pipeline.addLast(ZlibCodecFactory.newZlibEncoder(ZlibWrapper.GZIP));
                        //  pipeline.addLast(ZlibCodecFactory.newZlibDecoder(ZlibWrapper.GZIP));
// Add the number codec first,
                        pipeline.addLast(new Decoder());
                        pipeline.addLast(new Encoder());
// and then business logic.
// Please note we create a handler for every new channel
// because it has stateful properties.
                        pipeline.addLast(new GPSMessageHandler());
                    }
                });
        b.bind(new InetSocketAddress(
                "127.0.0.1", port));


    }


    public void contextDestroyed(ServletContextEvent sce) {
        log.info("netty stopping...");
        Future f1 = bossGroup.shutdownGracefully();
        Future f2 = workerGroup.shutdownGracefully();
        try {
            f1.await();
            f2.await();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
