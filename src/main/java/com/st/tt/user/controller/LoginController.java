package com.st.tt.user.controller;

import com.qq.connect.QQConnectException;
import com.qq.connect.api.OpenID;
import com.qq.connect.api.qzone.UserInfo;
import com.qq.connect.javabeans.qzone.UserInfoBean;
import com.qq.connect.oauth.Oauth;
import com.qq.connect.utils.http.HttpClient;
import com.qq.connect.utils.http.Response;
import com.st.tt.user.config.PropertiesConfig;
import com.st.tt.user.constants.Constants;
import com.st.tt.user.entity.Result;
import com.st.tt.user.entity.StatusCode;
import com.st.tt.user.listener.MyHttpSessionListener;
import com.st.tt.user.pojo.User;
import com.st.tt.user.service.UserService;
import com.st.tt.user.util.CookieUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by asus on 2019/2/28.
 */
@Controller
@CrossOrigin
@EnableConfigurationProperties(PropertiesConfig.class)
public class LoginController {
    @Autowired
    private PropertiesConfig propertiesConfig;
    @Autowired
    private UserService userService;

    public void setCookie(User user, HttpServletResponse response){
        CookieUtil.addCookie(response, Constants.COOKIE_USER,user.getId()+"", Constants.COOKIE_TIME);
    }
    @Autowired
    private HttpServletRequest request;
    @RequestMapping(value = "/user/showlogin",method = RequestMethod.GET)
    public String showLogin(){
        return "login";
    }
    @RequestMapping(value = "/login")
    @ResponseBody
    private Result login(@RequestParam("phone") String phone, @RequestParam("password")String password,HttpSession session){
        User user = new User();
        user.setPhone(phone);
        user.setPassword(password);
        user = userService.login(user.getPhone(),user.getPassword());
        if (user==null){
            return new Result(false, StatusCode.LOGINERROR,"登陆失败,手机号或密码错误!!!");
        }
        user.setPhone(phone.replaceAll("(\\d{3})\\d{4}(\\d{4})", "$1****$2"));
        request.getSession().setAttribute("user",user);
        return new Result(true, StatusCode.OK,"登陆成功");
    }


    /**
     * 点击登录跳转到QQ授权页面
     * @param request
     * @param response
     * @param httpSession
     * @return
     * @throws
     */

    @RequestMapping("/user/authorizeUrl")
    public String authorizeUrl(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws QQConnectException {
        //生成授权链接
        String authorizeUrl = new Oauth().getAuthorizeURL(request);
        System.out.println("authorizeUrl:"+authorizeUrl);
        return "redirect:" + authorizeUrl;
    }

    @RequestMapping("/qqLoginCallback")
    public String qqLoginCallback(HttpServletRequest request, HttpSession httpSession, @RequestParam("code") String code, @RequestParam("state") String state) throws QQConnectException {
        HttpClient httpClient =new HttpClient();
        Response response = httpClient.get(""+propertiesConfig.getAccessTokenURL()+
                "?grant_type=authorization_code&client_id="+
                propertiesConfig.getApp_ID()+"&client_secret="+
                propertiesConfig.getApp_KEY()+"&code="+code+"&redirect_uri="+
                propertiesConfig.getRedirect_URI()+"");
        String[] accessTokenObj = response.asString().split("&");
        System.out.println(accessTokenObj[0]);
        String accessTokens = "";
        for (int i = 0;i<accessTokenObj.length;i++){
            accessTokens = accessTokenObj[0];
        }
        String accessToken = accessTokens.split("=")[1];
        System.out.println(accessToken);
        //System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"+accessToken);
        if(StringUtils.isEmpty(accessToken)){
            request.setAttribute("error", "QQ授权失败");
            return "error";
        }
        // 数据查找openid是否关联,如果没有关联先跳转到关联账号页面,否则直接登录.
        OpenID openIDObj = new OpenID(accessToken);
        String openid = openIDObj.getUserOpenID();
        System.out.println("openid"+openid);
        User user = userService.findUserByOpenid(openid);
        if (user==null){
            httpSession.setAttribute("openid",openid);
            return "relation";
        }
        UserInfo qzoeUserInfo =  new UserInfo(accessToken,openid);
        UserInfoBean userInfoBean = qzoeUserInfo.getUserInfo();
        //System.out.println("$$$$$$$$$$$$$$$$$$$$$$$"+userInfoBean);
        Map<String,String>userInfo = new HashMap<>();
        userInfo.put("nickname",userInfoBean.getNickname());
        userInfo.put("headImage",userInfoBean.getAvatar().getAvatarURL30());
        request.getSession().setAttribute("userInfo",userInfo);
        return "homepage";
    }
    @RequestMapping(value = "/qqRelation",method = RequestMethod.POST)
    @ResponseBody
    public Result qqRelation(@RequestParam("password")String password, @RequestParam("phone")String phone, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession){
        System.out.println("phone"+phone);
        String openid = (String)httpSession.getAttribute("openid");
        if(StringUtils.isEmpty(openid)){
            request.setAttribute("error", "没有获取到openid");
            return  new Result(false, StatusCode.LOGINERROR,"关联失败!!!");
        }
        userService.save(openid,phone,password);
        User user = userService.findUserByOpenid(openid);
        request.getSession().setAttribute("user",user);
        return new Result(true, StatusCode.OK,"关联成功");
    }

    /**
     *查询在线人数
     */
}


























