package com.st.tt.user.mapper.entity;

import lombok.Data;

import java.util.Date;

/**
 * Created by asus on 2019/5/2.
 */
@Data
public class UserDo {
    /**
     * userid
     */

    private Long id;
    /**
     * 手机号码
     */
    private String phone;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 密码
     */
    private String password;
    /**
     * 用户名称
     */
    private String username;
    /**
     * 性别 0 男 1女
     */
    private char sex;
    /**
     * 年龄
     */
    private Long age;
    /**
     * 注册时间
     */
    private Date created;
    /**
     * 修改时间
     *
     */
    private Date updated;
    /**
     * 账号是否可以用 1 正常 0冻结
     */
    private char isAvalible;
    /**
     * 用户头像
     */
    private String picImg;
    /**
     * 用户关联 QQ 开放ID
     */
    private String qqOpenid;
    /**
     * 用户关联 微信 开放ID
     */
    private String wxOpenid;
}
