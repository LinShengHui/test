package com.priv.crmsys.dao;

import com.priv.crmsys.convertion.PageBean;
import com.priv.crmsys.entity.OrderDetails;

import java.util.List;

/**
 * Created by Administrator on 2017/12/26.
 */
public interface IOrderDetailsDao {
    public boolean addOderDetails(OrderDetails orderDetails);

    public List findOrderDetailsList(String hql);

    public List findOrderDetailsList(String hql,PageBean bean);

    public boolean updateOrderDetails(String sql);
}
