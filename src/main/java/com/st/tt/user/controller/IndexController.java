package com.st.tt.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by asus on 2019/4/6.
 */
@Controller
public class IndexController {

    @RequestMapping("/")
    public String home()
    {
        return "homepage";
    }
}
