package com.st.tt.user.base;

import lombok.Data;

/**
 * Created by asus on 2019/4/26.
 */
@Data
public class BaseResponse<T> {

    private Integer rtnCode;
    private String msg;
    private T data;

    public BaseResponse() {

    }

    public BaseResponse(Integer rtnCode, String msg, T data) {
        super();
        this.rtnCode = rtnCode;
        this.msg = msg;
        this.data = data;
    }

}