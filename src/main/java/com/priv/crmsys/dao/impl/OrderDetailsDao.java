package com.priv.crmsys.dao.impl;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import com.priv.crmsys.convertion.PageBean;
import com.priv.crmsys.dao.IOrderDetailsDao;
import com.priv.crmsys.entity.OrderDetails;

import java.util.List;

/**
 * Created by Administrator on 2017/12/26.
 */
@Repository("orderDetailsDao")
public class OrderDetailsDao extends BaseDao implements IOrderDetailsDao {


    @Override
    public boolean addOderDetails(OrderDetails orderDetails) {
        try {
            getSession().save(orderDetails);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List findOrderDetailsList(String hql) {
        return getSession().createQuery(hql).list();
    }

    //分页查询订单
    @Override
    public List findOrderDetailsList(String hql,PageBean bean){

        Query query=getSession().createQuery(hql);
        //设置分页
        query.setFirstResult((bean.getPage()-1)*bean.getLimit());//从哪里开始查询
        query.setMaxResults(bean.getLimit());//设置每页查询多少条
        //执行查询
        List list=query.list();
        return list;
    }

    @Override
    public boolean updateOrderDetails(String sql) {
        getSession().createSQLQuery(sql).executeUpdate();
        return true;
    }
}
