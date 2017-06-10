package com.laputa.gps.messages.mobile.pojo;


import com.laputa.gps.messages.AM;
import com.laputa.gps.messages.mobile.proto.Message;

public abstract class APMesg implements AM {
    private int len;
    private int requestId;
    private int code;

    public APMesg(AM am) {
        if (am != null) {
            setLen(am.getLen());
            setCode(am.getCode());
            setRequestId(am.getRequestId());
        }
    }

    public int getLen() {
        return len;
    }

    public void setLen(int len) {
        this.len = len;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public abstract Message toMessage();
}
