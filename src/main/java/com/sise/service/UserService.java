package com.sise.service;

//管理员用户service层接口


import com.sise.pojo.User;

public interface UserService {

    //用户登录
    User checkUser(String username,String password);
}
