package com.sise.web.admin;

import com.sise.pojo.User;
import com.sise.service.UserService;
import com.sise.util.CpachaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

//管理员用户登录控制器
@Controller
@RequestMapping("/admin")
public class LoginController {

    @Autowired
    private UserService userService;


    //通过/admin访问路径进入管理员用户登陆界面
    @GetMapping
    public String loginPage(){
        return "admin/login";
    }






    //通过/admin/login访问路径进行管理员用户登录验证
    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session, RedirectAttributes attributes){

        User user=userService.checkUser(username,password);

        if (user!=null){
            //防止前端获取密码 ，只把user的其他信息发送给前端
            user.setPassword(null);
            //清除验证码

            session.setAttribute("user",user);
            return "admin/index";
        }
        else{
            //用户名或密码错误时向前端发送提示信息并重定向到登录页面
            attributes.addFlashAttribute("message","用户名或密码错误");
            return "redirect:/admin";
        }
    }





/*
    @RequestMapping(value="/get_cpacha",method= RequestMethod.GET)
    public void getCpacha(HttpServletRequest request,
                          @RequestParam(value="vl",defaultValue="4",required=false) Integer vl,
                          @RequestParam(value="w",defaultValue="98",required=false) Integer w,
                          @RequestParam(value="h",defaultValue="33",required=false) Integer h,
                          HttpServletResponse response){
        System.out.println("getCpacha");
        CpachaUtil cpachaUtil=new CpachaUtil(vl,w,h);
        String generatorVCode = cpachaUtil.generatorVCode();
        request.getSession().setAttribute("loginCpacha", generatorVCode);
        BufferedImage generatorRotateVCodeImage = cpachaUtil.generatorRotateVCodeImage(generatorVCode, true);
        try {
            ImageIO.write(generatorRotateVCodeImage, "gif", response.getOutputStream());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
*/



    //注销用户
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/admin";
    }







}
