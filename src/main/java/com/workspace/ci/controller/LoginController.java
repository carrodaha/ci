package com.workspace.ci.controller;

import com.workspace.ci.formbean.LoginBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yujie on 2017/6/30.
 */
@Controller
public class LoginController {

    @RequestMapping(value = "/")
    public String main(){
        return "login/login";
    }



    @RequestMapping(value = "/login/main")
    public String login(LoginBean loginBean){
        return "login/main";
    }


}
