package com.example.springboot.controller;

import com.example.springboot.mapper.UserMapper;
import com.example.springboot.pojo.Json;
import com.example.springboot.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class LoginController {
    @Autowired
    private UserMapper userMapper;

    @PostMapping("/login")
    @ResponseBody
    public Json selectUserByName(@RequestBody User frontUser){
        Json json = new Json();
        User user=userMapper.selectUserByName(frontUser.getName());
        if(user==null){
            json.setStatuscode(1);
            json.setErrorInfo("The userName does not exist");
            return json;
        }
        else{
            if(!user.getPassword().equals(frontUser.getPassword())){
                json.setStatuscode(1);
                json.setErrorInfo("The password is not correct");
                return json;
            }
            else{
                json.setStatuscode(0);
                json.setErrorInfo("no error");
                return json;
            }
        }
    }
    @RequestMapping("/register")
    public String goToRegister(){
        return "register";
    }

    @PostMapping("/register")
    public Json regist(@RequestBody User frontUser){
        Json json = new Json();
        if(userMapper.selectUserByPhone(frontUser.getPhone())==null) {
            if(userMapper.selectUserByName(frontUser.getName())==null){
                User user = new User(frontUser.getName(),frontUser.getPassword(),frontUser.getPhone());
                userMapper.insertUser(user);
                json.setStatuscode(0);
                json.setErrorInfo("no error");
                return json;
            }
            else{
                json.setStatuscode(1);
                json.setErrorInfo("This userName has been registed");
                return json;
            }
        }
        else{
            json.setStatuscode(1);
            json.setErrorInfo("This phone has been registed");
            return json;
        }
    }
}
