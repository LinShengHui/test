package com.priv.crmsys.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.priv.crmsys.convertion.PageBean;
import com.priv.crmsys.entity.OrderDetails;
import com.priv.crmsys.service.IClientService;
import com.priv.crmsys.service.IOrderDetailsService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/12/25.
 */
@Controller
@RequestMapping("/orderDetailsAction")
public class OrderDetailsAction {

    @Resource(name = "clientService")
    public IClientService clientService;

    @Resource(name = "orderDetailsService")
    public IOrderDetailsService orderDetailsService;

    @RequestMapping("/findClienti")
    @ResponseBody
    public List findClienti() {
        //调用服务层方法
        return clientService.findClientList();
    }

    @RequestMapping("/addOrder")
    @ResponseBody
    public int addOrder(OrderDetails orderDetails) {
        if (orderDetailsService.addOrder(orderDetails)) {
            return 1;
        }
        return 0;
    }

    @RequestMapping("/findOrderDetailsList")
    @ResponseBody
    public PageBean findOrderDetailsList(PageBean bean) {
        PageBean bean1 = orderDetailsService.findOrderDetailsList(bean);
        return bean1;

    }

    @RequestMapping("/updateOrderDetails")
    @ResponseBody
    public int updateOrderDetails(int oid){
        if(orderDetailsService.updateOrderDetails(oid)){
            return 1;
        }else {
            return 0;
        }
    }

    public void setClientService(IClientService clientService) {

        this.clientService = clientService;
    }

    public void setOrderDetailsService(IOrderDetailsService orderDetailsService) {
        this.orderDetailsService = orderDetailsService;
    }
}
