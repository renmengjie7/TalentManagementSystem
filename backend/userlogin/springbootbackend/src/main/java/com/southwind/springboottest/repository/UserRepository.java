package com.southwind.springboottest.repository;

import com.southwind.springboottest.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User,Integer> {
    User findByPhone(String phone);
    User findByUserName(String userName);

}
