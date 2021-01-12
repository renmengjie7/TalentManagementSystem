package com.southwind.springboottest.repository;

import com.southwind.springboottest.entity.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @Test
    void findAll(){

    }
    @Test
    void regist() {
        if(userRepository.findByPhone("11111111112")==null)
        {
            User user = new User();
            user.setUserName("ocean");
            user.setPassword("123456");
            user.setPhone("11111111112");
            userRepository.save(user);
            return ;
        }
    }

    @Test
    void findByPhone() {
        User user = userRepository.findByPhone("11111111112");
        if(user ==null)
            System.out.println("no user");
        else{
            System.out.println(user.getUserName());
        }

    }
}