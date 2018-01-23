package com.priv.crmsys.service;

import com.priv.crmsys.convertion.PageBean;
import com.priv.crmsys.entity.OrderDetails;

import java.util.List;

/**
 * Created by Administrator on 2017/12/25.
 */
public interface IOrderDetailsService {

    public boolean addOrder(OrderDetails orderDetails);

    public List findOrderDetailsList();

    public PageBean findOrderDetailsList(PageBean bean);

    public boolean updateOrderDetails(int i);

}
