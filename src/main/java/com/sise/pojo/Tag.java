package com.sise.pojo;



import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;

//标签实体类
@Entity
@Table(name = "t_tag")
public class Tag {

    @Id
    @GeneratedValue
    private Long id;//标签ID

    //设置保存tag时name不能为空
    @NotBlank(message = "标签名称不能为空")
    private String name;//标签名称

    @ManyToMany(mappedBy = "tags")
    private List<Blog> blogs=new ArrayList<>();//设置博客与标签的关系，一篇博客可以有多种标签，一种标签可以有多篇博客。 博客:标签=n:n

    public Tag() {
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
        return "Tag{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
