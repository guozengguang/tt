package com.st.tt.user.dao;

import com.st.tt.user.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by asus on 2019/1/24.
 */
public interface UserDao extends JpaRepository<User,String>,JpaSpecificationExecutor<User>{
    @Query(value = "select * from st_user where openid = ?",nativeQuery = true)
    public User findUserByOpenid(String openid);

    public User findByPhone(String phone);
}
