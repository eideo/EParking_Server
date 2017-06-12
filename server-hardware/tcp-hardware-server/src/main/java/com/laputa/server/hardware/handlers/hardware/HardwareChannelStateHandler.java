package com.laputa.server.hardware.handlers.hardware;

import com.laputa.server.core.dao.SessionDao;
import com.laputa.server.core.model.DashBoard;
import com.laputa.server.core.model.auth.Session;
import com.laputa.server.core.model.device.Device;
import com.laputa.server.core.model.device.Status;

import com.laputa.server.core.session.HardwareStateHolder;

import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.handler.timeout.ReadTimeoutException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.concurrent.TimeUnit;

import static com.laputa.utils.StateHolderUtil.getHardState;

/**
 * The Laputa Project.
 * Created by Sommer
 * Created on 2/20/2015.
 *
 * Removes channel from session in case it became inactive (closed from client side).
 */
@ChannelHandler.Sharable
public class HardwareChannelStateHandler extends ChannelInboundHandlerAdapter {

    private static final Logger log = LogManager.getLogger(HardwareChannelStateHandler.class);

    private final SessionDao sessionDao;


    public HardwareChannelStateHandler(SessionDao sessionDao) {
        this.sessionDao = sessionDao;

    }

    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        HardwareStateHolder state = getHardState(ctx.channel());
        if (state != null) {
            Session session = sessionDao.userSession.get(state.userKey);
            if (session != null) {
                session.removeHardChannel(ctx.channel());
                log.trace("Hardware channel disconnect.");
                sentOfflineMessage(ctx, session, state);
            }
        }
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        if (cause instanceof ReadTimeoutException) {
            log.trace("Hardware timeout disconnect.");
        } else {
            super.exceptionCaught(ctx, cause);
        }
    }

    private void sentOfflineMessage(ChannelHandlerContext ctx, Session session, HardwareStateHolder state) {
        DashBoard dashBoard = state.user.profile.getDashByIdOrThrow(state.dashId);
        Device device = dashBoard.getDeviceById(state.deviceId);

        //this is special case.
        //in case hardware quickly reconnects we do not mark it as disconnected
        //as it is already online after quick disconnect.
        //https://github.com/blynkkk/laputa-server/issues/403
        boolean isHardwareConnected = session.isHardwareConnected(state.dashId, state.deviceId);
        if (device != null && !isHardwareConnected) {
            log.trace("Disconnected device id {}, dash id {}", state.deviceId, state.dashId);
            device.disconnected();
        }

        if (!dashBoard.isActive) {
            return;
        }


    }

    private void sendPushNotification(ChannelHandlerContext ctx, DashBoard dashBoard,   int dashId, Device device) {
        final String dashName = dashBoard.name == null ? "" : dashBoard.name;
        final String deviceName = ((device == null || device.name == null) ? "device" : device.name);
        String message = "Your " + deviceName + " went offline. \"" + dashName + "\" project is disconnected.";

    }

    private final class DelayedPush implements Runnable {

        private final Device device;

        private final String message;
        private final int dashId;

        public DelayedPush(Device device,  String message, int dashId) {
            this.device = device;

            this.message = message;
            this.dashId = dashId;
        }

        @Override
        public void run() {
            final long now = System.currentTimeMillis();

        }
    }

}
