package com.priv.crmsys.dao;

import com.priv.crmsys.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2017/11/10.
 */
public interface IUserDao {
    public User addUser(User user);

    public List findUserList(String hql);

    public boolean updateUserInfo(String sql);
}
