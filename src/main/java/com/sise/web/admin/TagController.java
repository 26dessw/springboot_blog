package com.sise.web.admin;

import com.sise.pojo.Tag;
import com.sise.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

//博客标签控制层
@Controller
@RequestMapping("/admin")
public class TagController {

    @Autowired
    TagService tagService;

    //获取博客标签列表:每页5条数据，根据id进行倒叙排序
    @GetMapping("/tags")
    public String tags(@PageableDefault(size = 5,sort = {"id"},direction = Sort.Direction.DESC) Pageable pageable, Model model){
        model.addAttribute("page",tagService.listTag(pageable));
        return "admin/tags";
    }



  // 跳转到新增博客标签页面admin/tags-input
  @GetMapping("/tags/input")
  public String input(Model model){
      model.addAttribute("tag",new Tag());
      return "admin/tags-input";
  }



    //提交,保存类型。@Valid:对tag设置校验，name不能为空;BindingResult:返回校验后的结果
    @PostMapping("/tags")
    public String post(@Valid Tag tag, BindingResult result, RedirectAttributes attributes){
        Tag tag1=tagService.getTagByName(tag.getName());
        //前端的tag的name已存在，给验证结果添加错误信息
        if (tag1!=null){
            result.rejectValue("name","nameError","不能添加重复的标签");
        }
        //前端返回type的name为空，存在错误，返回admin/types-input页面
        if (result.hasErrors()){
            return "admin/tags-input";
        }

        Tag t = tagService.saveTag(tag);
        if (t==null){
            attributes.addFlashAttribute("message","添加失败");
        }
        else {
            attributes.addFlashAttribute("message","添加成功");

        }
        return "redirect:/admin/tags";
    }






    //通过id查询标签，然后将相关信息发送到admin/tags-input页面
    @GetMapping("/tags/{id}/input")
    public String editInput(@PathVariable Long id, Model model){
        model.addAttribute("tag",tagService.getTag(id));
        return "admin/tags-input";
    }




    //修改标签。@Valid:对tags设置校验，name不能为空;BindingResult:返回校验后的结果
    @PostMapping("/tags/{id}")
    public String editPost(@Valid Tag tag, BindingResult result,@PathVariable Long id,RedirectAttributes attributes){
        Tag tag1=tagService.getTagByName(tag.getName());
        //前端的tag的name已存在，给验证结果添加错误信息
        if (tag1!=null){
            result.rejectValue("name","nameError","不能添加重复的标签");
        }
        //前端返回type的name为空，存在错误，返回admin/types-input页面
        if (result.hasErrors()){
            return "admin/tags-input";
        }

        Tag t = tagService.updateTag(id,tag);
        if (t==null){
            attributes.addFlashAttribute("message","更新失败");
        }
        else {
            attributes.addFlashAttribute("message","更新成功");

        }
        return "redirect:/admin/tags";
    }


    //删除标签;RedirectAttributes:校验
    @GetMapping("/tags/{id}/delete")
    public String delete(@PathVariable Long id,RedirectAttributes attributes){
        tagService.deleteTag(id);
        attributes.addFlashAttribute("message","删除成功");
        return "redirect:/admin/tags";
    }






}
