package com.laputa.gps.messages;

import com.laputa.gps.messages.mobile.proto.AuthMessage;
import com.laputa.gps.messages.mobile.proto.Message;
import com.laputa.gps.messages.mobile.proto.PositionMessage;
import com.laputa.gps.messages.mobile.proto.SettingsMessage;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;


import java.nio.ByteBuffer;
import java.util.List;

public class Decoder extends ByteToMessageDecoder {
    @Override
    protected void decode(ChannelHandlerContext channelHandlerContext, ByteBuf in, List<Object> out) throws Exception {

        if (in.readableBytes() < 12) {
            return;
        }
        in.markReaderIndex();
// Check the magic number.
        int len = in.readInt();

        // Wait until the whole data is available.
        if (in.readableBytes() < len) {
            in.resetReaderIndex();
            return;
        }
        int reqId = in.readInt();
        int code = in.readInt();


        byte[] decoded = new byte[len];
        in.readBytes(decoded);
        Message m = null;
        switch (code) {
            case Message.AUTH_MESSAGE:
                m = new AuthMessage(ByteBuffer.wrap(decoded), len, code, reqId);
                break;
            case Message.POS_MESSAGE:
                m = new PositionMessage(ByteBuffer.wrap(decoded), len, code, reqId);
                break;
            case Message.SETTINGS_MESSAGE:
                m = new SettingsMessage(ByteBuffer.wrap(decoded), len, code, reqId);
                break;
            default:
                break;
        }
        out.add(m);

    }
}
