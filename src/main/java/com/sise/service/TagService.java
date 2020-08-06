package com.sise.service;
//博客标签service层接口

import com.sise.pojo.Tag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface TagService {
    //保存博客标签类型
    Tag saveTag(Tag tag);

    //根据博客标签ID获取博客标签
    Tag getTag(Long id);

    //根据博客标签名称获取博客标签
    Tag getTagByName(String name);

    //获取分页的博客标签
    Page<Tag> listTag(Pageable pageable);



    //修改博客标签的信息
    Tag updateTag(Long id,Tag tag);

    //根据id删除博客标签
    void deleteTag(Long id);

    //获取所有标签
    List<Tag> listTag();

    List<Tag> listTag(String ids);

    //获取该标签博客数的top排名
    List<Tag> listTagTop(Integer size);
}
