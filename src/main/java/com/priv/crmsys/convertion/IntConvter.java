package com.priv.crmsys.convertion;

import org.springframework.core.convert.converter.Converter;

/**
 * 在SpringMVC中自定义一个整型转换器
 * Created by Administrator on 2017/11/2.
 */
public class IntConvter implements Converter<String,Integer>{

    @Override
    public Integer convert(String s) {
        if(s==null||s.equals(""))
            return 0;
        else{
            try{
                return Integer.parseInt(s);
            }catch (Exception e){
                return 0;
            }
        }
    }
}
