package com.priv.crmsys.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.priv.crmsys.entity.User;
import com.priv.crmsys.service.IUserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 * Created by Administrator on 2017/11/10.
 */
@Controller
@RequestMapping("/userAction")
public class UserAction {


    @Resource(name="userService")
    private IUserService userService;

    //用户注册
    @RequestMapping("/addUser")
    public String addUser(User user, HttpSession session ){

        user = userService.addUser(user);
        session.setAttribute("userInfo",user);
        //调用服务层方法
        return "redirect:/userData.jsp";
    }



    //用户登陆
    @RequestMapping("/userLogin")
    public String doLogin(@Validated User user,BindingResult result, Model model,HttpSession session){
        if(result.hasErrors()){//如果有错
            System.out.println("数据校验");
            //记录状态
            model.addAttribute("user",user);
            return "index";
        }
        user = userService.doLogin(user);
        if(user==null){
            session.setAttribute("message","用户名或者密码错误！");
            return "redirect:/index.jsp";
        }else{
            session.setAttribute("user",user);
            session.removeAttribute("message");
            return "redirect:/pages/homepage.jsp";
        }
    }


    //修改密码
    @RequestMapping("/amendUserPws")
    public String amendUserPws(User user,HttpSession session){
        if(userService.amendUserPws(user)){
            exitUser(session);
        }else{
            session.setAttribute("message","修改失败");
        }
        return "redirect:/userPage/update.jsp";
    }

    //退出账号
    @RequestMapping("/exitUser")
    public String exitUser(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/index.jsp";
    }


    /**
     * 用户修改
     * @param ufiles 文件
     * @param user
     * @param session
     * @return
     */
    @RequestMapping("/updateUser")
    public String updateUser(MultipartFile ufiles, User user,HttpSession session){

        //上传文件
        user.setImgUrl(uploading(ufiles,session));
        //调用服务层方法进行修改
        if(userService.updateUserInfo(user)){
            session.setAttribute("message","修改成功");
        }else{
            session.setAttribute("message","修改失败");
        }
        return "redirect:/userPage/update.jsp";
    }

    /**
     * 文件上传
     * @param ufiles  上传的文件
     * @param session  获取放置图片的路径
     * @return 返回保存至数据库路径
     */
   private String uploading(MultipartFile ufiles,HttpSession session){
       if(!ufiles.isEmpty()){
           //获取放置图片的路径
           String beanPath = session.getServletContext().getRealPath("/images");
           //获取图片名字
           String realName = ufiles.getOriginalFilename();
           try {
               //开始上传
               ufiles.transferTo(new File(beanPath+"/"+realName));
               System.out.println("文件上传路径"+beanPath+"/"+realName);
               //保存路径倒数据库
               String imgUrl = session.getServletContext().getContextPath()+"/images/"+realName;
               return imgUrl;
           } catch (IOException e) {
               e.printStackTrace();
           }
       }
       return null;
   }



    public void setUserService(IUserService userService) {
        this.userService = userService;
    }
}
