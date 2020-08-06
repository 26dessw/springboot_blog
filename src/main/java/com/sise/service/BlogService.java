package com.sise.service;

import com.sise.pojo.Blog;
import com.sise.pojo.BlogQuery;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

//博客service层接口
public interface BlogService {


    //通过id查询博客
    Blog getBlog(Long id);

    //根据Blog的参数分页查询博客
    Page<Blog> listBlog(Pageable pageable,BlogQuery blog);

    //保存博客
    Blog saveBlog(Blog blog);

    //修改博客信息
    Blog updateBlog(Long id,Blog blog);

    //根据博客id删除博客
    void deleteBlog(Long id);

    Page<Blog> listBlog(Pageable pageable);

    Page<Blog> listBlog(Long tagId,Pageable pageable);


    Page<Blog> listBlog(String query,Pageable pageable);

    List<Blog> listRecommendBlogTop(Integer size);


    Blog getAndConvert(Long id);


    Map<String,List<Blog>> archiveBlog();

    Long countBlog();

}
