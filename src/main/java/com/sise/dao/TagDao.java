package com.sise.dao;

import com.sise.pojo.Tag;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

//标签dao层接口:Tag:操作对象， Long：主键类型，  不需要实现方法，根据命名规则自动装配Type类的增删改查方法
public interface TagDao extends JpaRepository<Tag,Long> {

    //自己定义根据名字查询tag的方法
    Tag findByName(String name);

    //获取该标签博客数的top排名
    @Query("select t from Tag t")
    List<Tag> findTop(Pageable pageable);
}
