package com.laputa.server.hardware.handlers.hardware.logic;

import com.laputa.server.core.model.DashBoard;

import com.laputa.server.core.processors.NotificationBase;
import com.laputa.server.core.protocol.exceptions.NotificationBodyInvalidException;
import com.laputa.server.core.protocol.model.messages.StringMessage;
import com.laputa.server.core.session.HardwareStateHolder;

import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import static com.laputa.server.core.protocol.enums.Response.NOTIFICATION_ERROR;
import static com.laputa.server.core.protocol.enums.Response.NOTIFICATION_NOT_AUTHORIZED;
import static com.laputa.utils.LaputaByteBufUtil.makeResponse;
import static com.laputa.utils.LaputaByteBufUtil.ok;

/**
 * Sends tweets from hardware.
 *
 * The Laputa Project.
 * Created by Sommer
 * Created on 2/1/2015.
 *
 */
public class SmsLogic extends NotificationBase {

    private static final Logger log = LogManager.getLogger(SmsLogic.class);

    private static final int MAX_SMS_BODY_SIZE = 160;



    public SmsLogic( long notificationQuotaLimit) {
        super(notificationQuotaLimit);

    }

    public void messageReceived(ChannelHandlerContext ctx, HardwareStateHolder state, StringMessage message) {
        if (message.body == null || message.body.isEmpty() || message.body.length() > MAX_SMS_BODY_SIZE) {
            throw new NotificationBodyInvalidException();
        }

        DashBoard dash = state.user.profile.getDashByIdOrThrow(state.dashId);




        checkIfNotificationQuotaLimitIsNotReached();

        log.trace("Sending sms for user {}, with message : '{}'.", state.user.email, message.body);

    }

    private void sms(Channel channel, String email, String to, String body, int msgId) {
        try {

            channel.writeAndFlush(ok(msgId), channel.voidPromise());
        } catch (Exception e) {
            log.error("Error sending sms for user {}. Reason : {}",  email, e.getMessage());
            channel.writeAndFlush(makeResponse(msgId, NOTIFICATION_ERROR), channel.voidPromise());
        }
    }

}
