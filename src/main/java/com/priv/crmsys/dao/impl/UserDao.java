package com.priv.crmsys.dao.impl;

import org.springframework.stereotype.Repository;
import com.priv.crmsys.dao.IUserDao;
import com.priv.crmsys.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2017/11/6.
 */
@Repository("userDao")
public class UserDao extends BaseDao implements IUserDao {

    //添加一个用户，返回用户信息
    public User addUser(User user){
        return getSession().get(User.class, getSession().save(user));
    }

    //登陆方法
    public List findUserList(String hql){
        return getSession().createQuery(hql).list();
    }

    @Override
    public boolean updateUserInfo(String sql) {
        getSession().createSQLQuery(sql).executeUpdate();
        return true;
    }


}
