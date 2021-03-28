package com.example.springboot.mapper;

import com.example.springboot.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserMapper {
    User selectUserByName(String name);
    User selectUserByPhone(String phone);
    void insertUser(User user);
}
