package com.laputa.netty.codec;

import com.laputa.netty.utils.pack.Marshallable;
import com.laputa.netty.utils.pack.Pack;

/**
 * Request消息编码类
 * User: Dempe
 * Date: 2015/12/10
 * Time: 17:34
 * To change this template use File | Settings | File Templates.
 */
public class MarshallableEncoder extends AbstractEncoder {


    @Override
    public Pack encode(Marshallable request) {
        Pack pack = new Pack();
        request.marshal(pack);
        return pack;
    }

}
