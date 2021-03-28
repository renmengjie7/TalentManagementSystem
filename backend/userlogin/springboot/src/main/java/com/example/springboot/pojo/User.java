package com.example.springboot.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//人员表
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int id;
    private String name;
    private String password;
    private String phone;
    public User(String name, String password){
        this.name = name;
        this.password=password;
    }
    public User(String name, String password,String phone){
        this.name = name;
        this.password=password;
        this.phone=phone;
    }
}
