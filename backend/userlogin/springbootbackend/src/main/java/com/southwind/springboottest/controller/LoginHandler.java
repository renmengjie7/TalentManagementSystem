package com.southwind.springboottest.controller;

import com.southwind.springboottest.entity.Json;
import com.southwind.springboottest.entity.ReqUser;
import com.southwind.springboottest.entity.User;
import java.util.List;
import java.util.Map;

import com.southwind.springboottest.repository.UserRepository;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/backend")
public class LoginHandler {
    @Autowired
    private UserRepository userRepository;

    @PostMapping("/regist")
    public Json regist(@RequestBody ReqUser reqUser){
        Json json = new Json();
        if(userRepository.findByPhone(reqUser.getPhone())==null) {
            if(userRepository.findByUserName(reqUser.getUserName())==null){
                User user = new User();
                user.setUserName(reqUser.getUserName());
                user.setPassword(reqUser.getPassword());
                user.setPhone(reqUser.getPhone());
                userRepository.save(user);
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

    @PostMapping("/login")
    public Json login(@RequestBody ReqUser reqUser){
        Json json = new Json();
        User user = userRepository.findByUserName(reqUser.getUserName());
        if(user==null){
            json.setStatuscode(1);
            json.setErrorInfo("The userName does not exist");
            return json;
        }
        else{
            if(user.getPassword()!=reqUser.getPassword()){
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
}
