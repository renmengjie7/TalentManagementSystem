package com.southwind.springboottest;

import com.southwind.springboottest.entity.User;
import com.southwind.springboottest.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

@SpringBootTest
class SpringboottestApplicationTests {
    @Autowired
    private UserRepository repository;

    @Test
    void findAll(){
        System.out.println(repository.findAll());
    }

}
