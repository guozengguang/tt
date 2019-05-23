package com.st.tt.user.interceptor;

import com.st.tt.user.util.JwtUtil;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by asus on 2019/1/7.
 */
@Component
public class JwtInterceptor implements HandlerInterceptor {
    @Autowired
    private JwtUtil jwtUtil;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
       // System.out.println("经过拦截器了");
        String header = request.getHeader("Authorization");
        if(header!=null && !"".equals(header)){
            //如果包含Authorization就对齐解析
            if(header.startsWith("Bearer ")){
                String token = header.substring(7);
                //对令牌进行验证
                try{
                   Claims claims =  jwtUtil.parseJWT(token);
                   String roles = (String) claims.get("roles");
                   if(roles!=null && roles.equals("admin")){
                       request.setAttribute("claims_admin",token);
                   }
                    if(roles!=null && roles.equals("user")){
                        request.setAttribute("claims_user",token);
                    }
                }catch (Exception e){
                    throw new RuntimeException("令牌不正确");
                }
            }
        }
        return true;
    }
}
