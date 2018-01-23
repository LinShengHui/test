package com.priv.crmsys.entity;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 用户信息实体类
 * Created by Administrator on 2017/11/10.
 */
@Entity
@Table(name="tb_User")
public class User implements Serializable {

    private int uno;    //用户主键  自增
    @Length(min = 3,message = "{user.userI" +
            "D.error}")
    private String uid; //用户账号
    @Length(min = 3,message = "{user.userPassword.error}")
    private String upwd; //用户密码
    private String uname; //用户姓名
    private String imgUrl;//头像
    private int usex;  //用户性别
    private int udept; //属于部门
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date utime = new Date(); //入职时间
    private int upower=1; //权限 ，1为管理员，2为普通账号
    private int ustart=1; //用户状态 1:在线 ， 0：离职

    public User() {
    }

    public User(int uno, String uid, String upwd, String uname, String imgUrl, int usex, int udept, Date utime, int upower, int ustart) {
        this.uno = uno;
        this.uid = uid;
        this.upwd = upwd;
        this.uname = uname;
        this.imgUrl = imgUrl;
        this.usex = usex;
        this.udept = udept;
        this.utime = utime;
        this.upower = upower;
        this.ustart = ustart;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getUno() {
        return uno;
    }

    public void setUno(int uno) {
        this.uno = uno;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public int getUsex() {
        return usex;
    }

    public void setUsex(int usex) {
        this.usex = usex;
    }

    public int getUdept() {
        return udept;
    }

    public void setUdept(int udept) {
        this.udept = udept;
    }

    public int getUpower() {
        return upower;
    }

    public void setUpower(int upower) {
        this.upower = upower;
    }

    public int getUstart() {
        return ustart;
    }

    public void setUstart(int ustart) {
        this.ustart = ustart;
    }

    @Column(columnDefinition = "date")
    public Date getUtime() {
        return utime;
    }

    public void setUtime(Date utime) {
        this.utime = utime;
    }
}
