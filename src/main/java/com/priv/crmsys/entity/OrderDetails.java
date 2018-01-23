package com.priv.crmsys.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 详细信息表
 * Created by Administrator on 2017/12/24.
 */
@Entity
@Table(name="tb_orderDetails")
public class OrderDetails implements Serializable {
    private int oid;
    private String oproduct;//产品
    private int oproductNum;//产品数量
    private double osubtotal;//小计
    private double ogathering;//交易金额
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date otime =new  Date();//创建时间
    private int odealSky;//天数
    private String oexpressage; //快递类型
    private double omaterials; //材料费用
    private String remark; //备注
    private int ostate;

    private Client client;

    public OrderDetails() {
    }

    public OrderDetails(int oid, String oproduct, int oproductNum, double osubtotal, double ogathering, Date otime, int odealSky, String oexpressage, double omaterials, String remark, int ostate, Client client) {
        this.oid = oid;
        this.oproduct = oproduct;
        this.oproductNum = oproductNum;
        this.osubtotal = osubtotal;
        this.ogathering = ogathering;
        this.otime = otime;
        this.odealSky = odealSky;
        this.oexpressage = oexpressage;
        this.omaterials = omaterials;
        this.remark = remark;
        this.ostate = ostate;
        this.client = client;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }
    public int getOstate() {
        return ostate;
    }

    public void setOstate(int ostate) {
        this.ostate = ostate;
    }



    public String getOproduct() {
        return oproduct;
    }

    public void setOproduct(String oproduct) {
        this.oproduct = oproduct;
    }

    public int getOproductNum() {
        return oproductNum;
    }

    @Column(columnDefinition = "date")
    public Date getOtime() {
        return otime;
    }

    public void setOtime(Date otime) {
        this.otime = otime;
    }

    public void setOproductNum(int oproductNum) {
        this.oproductNum = oproductNum;
    }

    public double getOsubtotal() {
        return osubtotal;
    }

    public void setOsubtotal(double osubtotal) {
        this.osubtotal = osubtotal;
    }

    public double getOgathering() {
        return ogathering;
    }

    public void setOgathering(double ogathering) {
        this.ogathering = ogathering;
    }

    public int getOdealSky() {
        return odealSky;
    }

    public void setOdealSky(int odealSky) {
        this.odealSky = odealSky;
    }

    public String getOexpressage() {
        return oexpressage;
    }

    public void setOexpressage(String oexpressage) {
        this.oexpressage = oexpressage;
    }

    public double getOmaterials() {
        return omaterials;
    }

    public void setOmaterials(double omaterials) {
        this.omaterials = omaterials;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @ManyToOne()
    @JoinColumn(name="ocno")
    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

}
