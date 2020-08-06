package com.sise.service;

import com.sise.NotFoundException;
import com.sise.dao.TagDao;
import com.sise.pojo.Tag;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

//博客标签service层实现类:增删改查放进事务里
@Service
public class TagServiceImpl implements TagService{

    @Autowired
    TagDao tagDao;


    //保存博客标签类型
    @Transactional
    @Override
    public Tag saveTag(Tag tag) {
        return tagDao.save(tag);
    }

    //根据博客标签ID获取博客标签
    @Transactional
    @Override
    public Tag getTag(Long id) {
        return tagDao.findById(id).get();
    }

    //根据博客标签名称获取博客标签
    @Transactional
    @Override
    public Tag getTagByName(String name) {
        return tagDao.findByName(name);
    }

    //获取分页的博客标签
    @Transactional
    @Override
    public Page<Tag> listTag(Pageable pageable) {
        return tagDao.findAll(pageable);
    }



    //修改博客标签的信息
    @Transactional
    @Override
    public Tag updateTag(Long id, Tag tag) {
        Tag t=tagDao.findById(id).get();
        if (t==null){
            throw new NotFoundException("对象不存在");
        }
        BeanUtils.copyProperties(tag,t);
        return tagDao.save(t);
    }




    //根据id删除博客标签
    @Transactional
    @Override
    public void deleteTag(Long id) {

        tagDao.deleteById(id);
    }


    //查询所有标签
    @Override
    public List<Tag> listTag() {
        return tagDao.findAll();
    }


    private List<Long> convertToList(String ids) {
        List<Long> list = new ArrayList<>();
        if (!"".equals(ids) && ids != null) {
            String[] idarray = ids.split(",");
            for (int i=0; i < idarray.length;i++) {
                list.add(new Long(idarray[i]));
            }
        }
        return list;
    }




    @Override
    public List<Tag> listTag(String ids) {

        return tagDao.findAllById(convertToList(ids));
    }


    //获取该标签博客数的top排名
    @Override
    public List<Tag> listTagTop(Integer size) {
        Sort sort=Sort.by(Sort.Order.desc("blogs.size"));
        Pageable pageable= PageRequest.of(0,size,sort);

        return tagDao.findTop(pageable);
    }



}
