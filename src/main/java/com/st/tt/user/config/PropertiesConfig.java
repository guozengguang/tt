package com.st.tt.user.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * Created by asus on 2019/4/5.
 */
@Configuration
@Component
@ConfigurationProperties(value = "",ignoreInvalidFields = false)
@PropertySource("classpath:qqconnectconfig.properties")
public class PropertiesConfig {
    private String app_ID;
    private String app_KEY;
    private String accessTokenURL;
    private String redirect_URI;

    public String getApp_KEY() {
        return app_KEY;
    }

    public void setApp_KEY(String app_KEY) {
        this.app_KEY = app_KEY;
    }

    public String getAccessTokenURL() {
        return accessTokenURL;
    }

    public void setAccessTokenURL(String accessTokenURL) {
        this.accessTokenURL = accessTokenURL;
    }

    public String getRedirect_URI() {
        return redirect_URI;
    }

    public void setRedirect_URI(String redirect_URI) {
        this.redirect_URI = redirect_URI;
    }

    public String getApp_ID() {
        return app_ID;
    }

    public void setApp_ID(String app_ID) {
        this.app_ID = app_ID;
    }
}
