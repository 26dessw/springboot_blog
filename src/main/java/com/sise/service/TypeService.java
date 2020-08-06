package com.sise.service;

//博客分类service层接口

import com.sise.pojo.Type;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface TypeService {

    //保存分类类型
    Type saveType(Type type);

    //根据类型ID获取类型
    Type getType(Long id);

    //根据类型名称获取类型
    Type getTypeByName(String name);

    //获取分页的类型
    Page<Type> listType(Pageable pageable);


    List<Type> listTypeTop(Integer size);

    //修改分类的信息
    Type updateType(Long id,Type type);

    //根据id删除分类类型
    void deleteType(Long id);

    //查询所有分类
    public List<Type> listType();
}
