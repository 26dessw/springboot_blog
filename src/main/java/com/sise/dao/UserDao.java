package com.sise.dao;


import com.sise.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;

//管理员用户dao层接口:User:操作对象， Long：主键类型，  不需要实现方法，根据命名规则自动装配user类的增删改查方法
public interface UserDao extends JpaRepository<User,Long> {

    //自己定义根据名字和密码查询user的方法
    User findByUsernameAndPassword(String username,String password);
}
