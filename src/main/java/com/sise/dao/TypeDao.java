package com.sise.dao;

import com.sise.pojo.Type;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

//博客分类dao层接口:Type:操作对象， Long：主键类型，  不需要实现方法，根据命名规则自动装配Type类的增删改查方法
public interface TypeDao extends JpaRepository<Type,Long> {

    //自己定义根据名字查询type的方法
    Type findByName(String name);

    @Query("select t from Type t")
    List<Type> findTop(Pageable pageable);
}
