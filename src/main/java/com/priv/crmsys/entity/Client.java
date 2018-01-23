package com.priv.crmsys.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2017/11/14.
 */
@Entity
@Table(name="tb_chient")
public class Client implements Serializable {
    private int cno;       //编号
    private String cname;  //客户姓名
    private String csex; //客户性别
    private String ccompany; //客户所在公司
    private String cphone; //客户联系电话
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date ctime = new Date();//合作时间
    private int cstart;//客户状态 1：合作中，2，无合作
    private double ccredit; //客户信誉评分 10 为满分，基础分6 分，成功合作  好评+1分  中评0.5分  差评扣2分


    public Client() {
    }

    public Client(int cno, String cname, String csex, String ccompany, String cphone, Date ctime, int cstart, double ccredit) {
        this.cno = cno;
        this.cname = cname;
        this.csex = csex;
        this.ccompany = ccompany;
        this.cphone = cphone;
        this.ctime = ctime;
        this.cstart = cstart;
        this.ccredit = ccredit;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getCno() {
        return cno;
    }
    public void setCno(int cno) {
        this.cno = cno;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCsex() {
        return csex;
    }

    public void setCsex(String csex) {
        this.csex = csex;
    }

    public String getCcompany() {
        return ccompany;
    }

    public void setCcompany(String ccompany) {
        this.ccompany = ccompany;
    }

    public String getCphone() {
        return cphone;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    @Column(columnDefinition = "date")
    public Date getCtime() {
        return ctime;
    }

    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

    public int getCstart() {
        return cstart;
    }

    public void setCstart(int cstart) {
        this.cstart = cstart;
    }

    @Column(columnDefinition = "double")
    public double getCcredit() {
        return ccredit;
    }

    public void setCcredit(double ccredit) {
        this.ccredit = ccredit;
    }
}
