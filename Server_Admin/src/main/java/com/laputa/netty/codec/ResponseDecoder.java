package com.laputa.netty.codec;

import com.laputa.netty.proto.Response;
import com.laputa.netty.utils.pack.Marshallable;
import com.laputa.netty.utils.pack.Unpack;

import java.io.IOException;

/**
 * Response消息解码类
 * User: Dempe
 * Date: 2015/12/10
 * Time: 17:34
 * To change this template use File | Settings | File Templates.
 */
public class ResponseDecoder extends AbstractDecoder {


    @Override
    public Marshallable decode(Unpack unpack) throws IOException {
        Response response = new Response();
        response.unmarshal(unpack);
        return response;
    }
}
