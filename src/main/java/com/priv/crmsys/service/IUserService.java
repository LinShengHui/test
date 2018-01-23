package com.priv.crmsys.service;

import com.priv.crmsys.entity.User;

/**
 * Created by Administrator on 2017/11/10.
 */
public interface IUserService {
    //用户注册
    public User addUser(User user);

    //用户登陆
    public User doLogin(User user);

    public boolean updateUserInfo(User user);

    public boolean amendUserPws(User user);
}
