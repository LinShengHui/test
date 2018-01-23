package com.priv.crmsys.service.impl;


import com.priv.crmsys.convertion.DateFormatUtil;
import com.priv.crmsys.dao.IUserDao;
import com.priv.crmsys.dao.impl.UserDao;
import com.priv.crmsys.entity.User;
import com.priv.crmsys.service.IUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/11/6.
 */
@Service("userService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserService implements IUserService {

    @Resource(name="userDao")
    private IUserDao userDao;

    //用户注册
    public User addUser(User user){
        return userDao.addUser(user);
    }

    //用户登陆
    public User doLogin(User user){
        String hql = "from User u where u.uid='"+user.getUid()+"'";
        List<User> list = userDao.findUserList(hql);
        if(list!=null&&list.size()>0){
            for (User users:list){
                if(users.getUid().equals(user.getUid())&&users.getUpwd().equals(user.getUpwd())){
                    return users;
                }
            }
        }
        return null;
    }

    //用户信息修改
    public boolean updateUserInfo(User user){
        String sql="";
        String sqldate= DateFormatUtil.format(user.getUtime());
      if(user.getImgUrl()!=null&&user.getImgUrl().length()>0){
          sql="update tb_user SET  usex="+user.getUsex()+" , imgUrl='"+user.getImgUrl()+"' , utime='"+sqldate+"'" +
                  " , uname='"+user.getUname()+"'  WHERE uno="+user.getUno();
      }else{
        sql="update tb_user SET  usex="+user.getUsex()+" ,utime='"+sqldate+"'  , uname='"+user.getUname()+"'  WHERE uno="+user.getUno();
      }
          return userDao.updateUserInfo(sql);
    }

    @Override
    public boolean amendUserPws(User user) {
        String sql = "update tb_user SET upwd='"+user.getUpwd()+"' where uno="+user.getUno();
        return userDao.updateUserInfo(sql);
    }


    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
