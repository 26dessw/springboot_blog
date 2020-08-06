package com.sise.web.admin;


import com.sise.pojo.Type;
import com.sise.service.TypeService;
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


//博客分类类型控制器
@Controller
@RequestMapping("/admin")
public class TypeController {

    @Autowired
    private TypeService typeService;


    //获取博客分类列表:每页5条数据，根据id进行倒叙排序
    @GetMapping("/types")
    public String types(@PageableDefault(size = 5,sort = {"id"},direction = Sort.Direction.DESC) Pageable pageable,Model model){

        model.addAttribute("page",typeService.listType(pageable));
        return "admin/types";
    }

   // 跳转到新增博客页面admin/types-input
    @GetMapping("/types/input")
    public String input(Model model){
        model.addAttribute("type",new Type());
        return "admin/types-input";
    }


    //提交,保存类型。@Valid:对type设置校验，name不能为空;BindingResult:返回校验后的结果
    @PostMapping("/types")
    public String post(@Valid Type type, BindingResult result, RedirectAttributes attributes){
        Type type1=typeService.getTypeByName(type.getName());
        //前端的type的name已存在，给验证结果添加错误信息
        if (type1!=null){
            result.rejectValue("name","nameError","不能添加重复的分类");
        }
        //前端返回type的name为空，存在错误，返回admin/types-input页面
        if (result.hasErrors()){
            return "admin/types-input";
        }

        Type t = typeService.saveType(type);
        if (t==null){
            attributes.addFlashAttribute("message","添加失败");
        }
        else {
            attributes.addFlashAttribute("message","添加成功");

        }
        return "redirect:/admin/types";
    }



    //通过id查询分类，然后将相关信息发送到admin/types-input页面
    @GetMapping("/types/{id}/input")
    public String editInput(@PathVariable Long id, Model model){
        model.addAttribute("type",typeService.getType(id));
        return "admin/types-input";
    }




    //修改分类。@Valid:对type设置校验，name不能为空;BindingResult:返回校验后的结果
    @PostMapping("/types/{id}")
    public String editPost(@Valid Type type, BindingResult result,@PathVariable Long id,RedirectAttributes attributes){
        Type type1=typeService.getTypeByName(type.getName());
        //前端的type的name已存在，给验证结果添加错误信息
        if (type1!=null){
            result.rejectValue("name","nameError","不能添加重复的分类");
        }
        //前端返回type的name为空，存在错误，返回admin/types-input页面
        if (result.hasErrors()){
            return "admin/types-input";
        }

        Type t = typeService.updateType(id,type);
        if (t==null){
            attributes.addFlashAttribute("message","更新失败");
        }
        else {
            attributes.addFlashAttribute("message","更新成功");

        }
        return "redirect:/admin/types";
    }


    //删除分类;RedirectAttributes:校验
    @GetMapping("/types/{id}/delete")
    public String delete(@PathVariable Long id,RedirectAttributes attributes){
        typeService.deleteType(id);
        attributes.addFlashAttribute("message","删除成功");
        return "redirect:/admin/types";
    }


}
