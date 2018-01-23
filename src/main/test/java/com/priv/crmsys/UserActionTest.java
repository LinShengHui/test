package com.priv.crmsys;

import com.priv.crmsys.entity.User;
import com.priv.crmsys.service.IUserService;
import junit.framework.TestCase;
import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 * Created by Administrator on 2017/11/10.
 */
@Controller
@RequestMapping("/userActionTest")
public class UserActionTest extends TestCase {
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

    @Test
    @RequestMapping("/testUser")
    public String testUser(User user){
        System.out.println(user.getUid());
        return "redirect:/index.jsp";
    }

    //用户登陆
    @Test
    public void doLogin(){
        User user = new User();
        user.setUid("admins");
        user.setUpwd("123");
        User user1 = userService.doLogin(user);
        if(user1==null){
            System.out.println("密码错误");

        }else{
            System.out.println("密码正确");
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
