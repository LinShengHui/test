package com.priv.crmsys.validation;

import com.priv.crmsys.entity.User;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Created by Administrator on 2017/12/11.
 */
public class LoginValidation implements Validator{
    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        if(o!=null){
            User user = (User) o;
            if(user.getUid()==null&&user.getUid().length()<6){
                errors.rejectValue("uid",null,"账号不符合");
            }
            if(user.getUpwd().length()<6){
                errors.rejectValue("upwd",null,"密码长度不符合");
            }
        }
    }
}
