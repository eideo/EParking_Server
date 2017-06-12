package com.laputa.server;


import com.laputa.utils.ServerProperties;
import com.laputa.utils.SslUtil;
import io.netty.handler.ssl.SslContext;
import io.netty.handler.ssl.SslProvider;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * The Laputa Project.
 * Created by Sommer
 * Created on 30.04.17.
 */
public class SslContextHolder {

    private static final Logger log = LogManager.getLogger(SslContextHolder.class);

    public volatile SslContext sslCtx;



    public final boolean isAutoGenerationEnabled;

    public final boolean isNeedInitializeOnStart =false;


    public SslContextHolder(ServerProperties props, String email) {


        String certPath = props.getProperty("server.ssl.cert");
        String keyPath = props.getProperty("server.ssl.key");
        String keyPass = props.getProperty("server.ssl.key.pass");

        if (certPath == null || certPath.isEmpty()) {
            log.info("Didn't find custom user certificates.");
            isAutoGenerationEnabled = true;
        } else {
            isAutoGenerationEnabled = false;
        }



        SslProvider sslProvider = SslUtil.fetchSslProvider(props);
        this.sslCtx = SslUtil.initSslContext(certPath, keyPath, keyPass, sslProvider, true);
    }

    public void regenerate(ServerProperties props) {


        SslProvider sslProvider = SslUtil.fetchSslProvider(props);
    }

    public void generateInitialCertificates(ServerProperties props) {
        if (isAutoGenerationEnabled && isNeedInitializeOnStart) {
            System.out.println("Generating own initial certificates...");

        }
    }

}
