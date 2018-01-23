package com.priv.crmsys.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.priv.crmsys.convertion.PageBean;
import com.priv.crmsys.dao.IOrderDetailsDao;
import com.priv.crmsys.entity.OrderDetails;
import com.priv.crmsys.service.IOrderDetailsService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/12/26.
 */
@Service("orderDetailsService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderDetailsService implements IOrderDetailsService {

    @Resource(name="orderDetailsDao")
    public IOrderDetailsDao orderDetailsDao;

    @Override
    public boolean addOrder(OrderDetails orderDetails) {
        return orderDetailsDao.addOderDetails(orderDetails);
    }

    @Override
    public List findOrderDetailsList() {
        String hql = "from OrderDetails o ORDER BY o.ostate asc ";
        return orderDetailsDao.findOrderDetailsList(hql);
    }

    //分页查询
    @Override
    public PageBean findOrderDetailsList(PageBean bean) {
        //默认HQL语句
        String hql = "from OrderDetails o ORDER BY o.ostate asc  ";

        //执行查询获取当前页要显示的数据
        bean.setData(orderDetailsDao.findOrderDetailsList(hql, bean));
        //获取总的数据条数
        bean.setCount(orderDetailsDao.findOrderDetailsList(hql).size());
        return bean;
    }

    @Override
    public boolean updateOrderDetails(int i) {
        String sql="update  tb_orderdetails o SET o.ostate=1 where o.oid="+i;
        return orderDetailsDao.updateOrderDetails(sql);
    }

    public void setOrderDetailsDao(IOrderDetailsDao orderDetailsDao) {
        this.orderDetailsDao = orderDetailsDao;
    }


}
