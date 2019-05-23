package com.st.tt.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by asus on 2019/4/1.
 */
@Controller
public class showIndexController {
    @RequestMapping("/showArticle")
    public String showArticle(){
        return "article";
    }
    @RequestMapping("/showTimeline")
    public String timeline(){
        return "timeline";
    }
    @RequestMapping("/showAbbout")
    public String showAbbout(){
        return "about";
    }
    @RequestMapping("/showResource")
    public String showResource(){
        return "resource";
    }
    @RequestMapping("/showDetail")
    public String showDetail(){
        return "detail";
    }

    @RequestMapping("/reg")
    public String reg(){
        return "weixin/reg";
    }

}
