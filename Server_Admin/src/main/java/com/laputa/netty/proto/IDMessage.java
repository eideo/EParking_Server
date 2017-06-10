package com.laputa.netty.proto;

import com.laputa.netty.utils.pack.Marshallable;
import com.laputa.netty.utils.pack.Pack;
import com.laputa.netty.utils.pack.Unpack;

import java.io.IOException;
import java.nio.ByteBuffer;

/**
 * Created with IntelliJ IDEA.
 * User: Dempe
 * Date: 2016/3/9
 * Time: 10:04
 * To change this template use File | Settings | File Templates.
 */
public class IDMessage implements Marshallable {

    protected int messageID;

    private byte[] bytes;

    public int getMessageID() {
        return messageID;
    }

    public void setMessageID(int messageID) {
        this.messageID = messageID;
    }

    public byte[] getBytes() {
        return bytes;
    }

    public void setBytes(byte[] bytes) {
        this.bytes = bytes;
    }

    @Override
    public void marshal(Pack pack) {
        pack.putInt(messageID);
        pack.putBuffer(ByteBuffer.wrap(bytes));
    }

    @Override
    public void unmarshal(Unpack unpack) throws IOException {
        messageID = unpack.popInt();
        int remaining = unpack.getBuffer().remaining();
        bytes = unpack.popFetch(remaining);
    }
}
