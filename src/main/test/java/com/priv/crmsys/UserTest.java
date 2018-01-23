package com.priv.crmsys;

import com.priv.crmsys.dao.impl.UserDao;
import com.priv.crmsys.entity.User;
import com.priv.crmsys.service.impl.UserService;
import junit.framework.TestCase;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * Created by Administrator on 2018/1/22.
 */
@Controller
public class UserTest extends TestCase {


    //用户登陆
    public void test_doLogin(){
        UserService service=new UserService();
        User user = new User();
        user.setUid("admins");
        user.setUpwd("123");
        User user1 = service.doLogin(user);
        if(user1==null){
            System.out.println("密码错误");
        }else{
            System.out.println("密码正确1");
        }
    }

    public void test_findUser(){
        UserDao dao = new UserDao();
        String hql = "from User u where u.uid='admins'";
        List list=dao.findUserList(hql);
        System.out.println(list.size());
    }


}
