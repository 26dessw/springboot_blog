package com.sise.pojo;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;

//分类实体类
@Entity
@Table(name = "t_type")
public class Type {

    @Id
    @GeneratedValue
    private Long id;//分类ID

    //设置保存type时name不能为空
    @NotBlank(message = "分类名称不能为空")
    private String name;//分类名称

    @OneToMany(mappedBy = "type")
    private List<Blog> blogs=new ArrayList<>();//设置博客与类型的关系，一篇博客只有一种类型，一种类型可以有多篇博客。 博客:类型=n:1

    public Type() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Blog> getBlogs() {
        return blogs;
    }

    public void setBlogs(List<Blog> blogs) {
        this.blogs = blogs;
    }

    @Override
    public String toString() {
        return "Type{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
