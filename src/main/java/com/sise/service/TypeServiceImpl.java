package com.sise.service;

import com.sise.NotFoundException;
import com.sise.dao.TypeDao;
import com.sise.pojo.Type;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


//博客分类service层实现类:增删改查放进事务里
@Service
public class TypeServiceImpl implements TypeService{


    @Autowired
    TypeDao typeDao;

    //保存分类类型
    @Transactional
    @Override
    public Type saveType(Type type) {
        return typeDao.save(type);
    }



    //根据类型ID获取类型
    @Transactional
    @Override
    public Type getType(Long id) {
        return typeDao.findById(id).get();
    }



    //获取分页的类型
    @Transactional
    @Override
    public Page<Type> listType(Pageable pageable) {
        return typeDao.findAll(pageable);
    }

    @Override
    public List<Type> listTypeTop(Integer size) {
      Sort sort=Sort.by(Sort.Order.desc("blogs.size"));
        Pageable pageable=PageRequest.of(0,size,sort);

        return typeDao.findTop(pageable);
    }


    //修改分类的信息
    @Transactional
    @Override
    public Type updateType(Long id, Type type) {
        Type t=typeDao.findById(id).get();
        if (t==null){
            throw new NotFoundException("对象不存在");
        }
        BeanUtils.copyProperties(type,t);
        return typeDao.save(t);
    }



    //根据id删除分类类型
    @Transactional
    @Override
    public void deleteType(Long id) {
        typeDao.deleteById(id);
    }


    //根据类型名称获取类型
    @Override
    public Type getTypeByName(String name) {
        return typeDao.findByName(name);
    }


    //获取所有分类
    @Override
    public List<Type> listType() {
        return typeDao.findAll();
    }
}
