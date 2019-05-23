package com.st.tt.user.service;


import com.st.tt.user.dao.UserDao;
import com.st.tt.user.pojo.User;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * Created by asus on 2019/1/24.
 */
@Service
@Transactional
public class UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private RabbitTemplate rabbitTemplate;
    @Autowired
    private BCryptPasswordEncoder encoder;

    public void sendsms(String phone) {
        //生成6位随机数
        String checkcode = RandomStringUtils.randomNumeric(6);
        //redis中存一份用来验证
        redisTemplate.opsForValue().set("checkcode_"+phone,checkcode,6,TimeUnit.HOURS);
        //消息队列存一份用来发送给用户
        Map<String,String> map = new HashMap<>();
        map.put("phone",phone);
        map.put("checkcode",checkcode);
        rabbitTemplate.convertAndSend("sms",map);
        //控制台显示用来测试
        System.out.println("验证码："+checkcode);

    }

    public void save(String username, String password, String phone, String checkcode) {
        String redisCkeckcode = (String) redisTemplate.opsForValue().get("checkcode_"+phone);
        if(StringUtils.isEmpty(redisCkeckcode)){
            throw new RuntimeException("请点击获取短信验证码");
        }
        if(!checkcode.equals(redisCkeckcode)){
            throw new RuntimeException("验证码错误!");
        }
        User user = new User();
        user.setCreated(new Date());
        user.setPassword(encoder.encode(password));
        user.setPhone(phone);
        user.setUpdated(new Date());
        user.setUsername(username);
        userDao.save(user);
    }
    public User findUserByOpenid(String openid){
        if(StringUtils.isEmpty(openid)){
            throw new RuntimeException("openid不能为空!");
        }
        return userDao.findUserByOpenid(openid);
    }
    public void save(String openid,String phone,String password){
        User user = new User();
        user.setUsername("手机用户"+phone);
        user.setPhone(phone);
        user.setCreated(new Date());
        user.setPassword(encoder.encode(password));
        user.setUpdated(new Date());
        user.setOpenid(openid);
        System.out.println("--------------"+user);
        userDao.save(user);
    }

    //登录
    public User login(String phone, String password){
        User user = userDao.findByPhone(phone);
        if(user!=null && encoder.matches(password,user.getPassword())){
            return user;
        }
        return null;
    }

}
