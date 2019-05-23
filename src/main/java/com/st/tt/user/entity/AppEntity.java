package com.st.tt.user.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 微信服务运用实体类
 *
 * Created by asus on 2019/4/23.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AppEntity {
    /*
     *appid
     */
    private String appId;
    /*
     *appName
     */
    private String appName;


}
