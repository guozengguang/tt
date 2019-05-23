package com.st.tt.user.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by asus on 2019/4/6.
 */
@WebListener
public class MyHttpSessionListener implements HttpSessionListener{
    private static AtomicInteger onLineCount = new AtomicInteger(0);
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("创建session");
        onLineCount.incrementAndGet();
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("销毁session");
        onLineCount.getAndDecrement();

    }
    public Integer getCount(){
        return onLineCount.get();
    }
}
