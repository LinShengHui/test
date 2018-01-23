package com.priv.crmsys.convertion;

import java.util.List;

/**
 * 用来封装分页信息的工具类
 * @author Administrator
 *
 */
public class PageBean {

    private int code=0;//数据状态的值
    private int page=1;
    private int limit=5;
    private String msg;
    private int count=0;//数据总条数

    private List data;//每页要显示的数据

    public PageBean() {
    }

    public PageBean(int code, int page, int limit, String msg, int count, List data) {
        this.code = code;
        this.page = page;
        this.limit = limit;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }
}




//spring boot




