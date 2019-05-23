package com.st.tt.user.mapper;

import com.st.tt.user.mapper.entity.UserDo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * Created by asus on 2019/5/2.
 */
public interface WeixinUserMapper {
    @Select("SELECT * FROM st_user WHERE phone=#{phone};")
    UserDo existMobile(@Param("phone") String mobile);

    @Insert("INSERT INTO `st_user` VALUES (null,null, #{password}, #{phone}, null, #{created}, #{updated}, null, null, null, null, #{isAvalible},null,null,null);")

    int register(UserDo userDo);
}
