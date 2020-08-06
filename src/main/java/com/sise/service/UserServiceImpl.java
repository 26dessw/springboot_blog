package com.sise.service;

import com.sise.dao.UserDao;
import com.sise.pojo.User;
import com.sise.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//管理员用户service层实现类
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    //用户登录
    @Override
    public User checkUser(String username, String password) {
        User user=userDao.findByUsernameAndPassword(username, MD5Utils.code(password));

        return user;
    }
}
