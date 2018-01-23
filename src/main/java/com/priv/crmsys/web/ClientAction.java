package com.priv.crmsys.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.priv.crmsys.convertion.PageBean;
import com.priv.crmsys.entity.Client;
import com.priv.crmsys.service.IClientService;

import javax.annotation.Resource;
import java.util.List;

/**
 * 管理用户Action
 * Created by Administrator on 2017/12/4.
 */
@Controller
@RequestMapping("chientAction")
public class ClientAction {

    @Resource(name="clientService")
    private IClientService clientService;

    //添加客户
    @RequestMapping("/addClient")
    public String addClient(Client client) {
        Client client1 = clientService.addClient(client);
        return "redirect:/pages/homepage.jsp";
    }

    //修改客户
    @RequestMapping("/updataClient")
    public String  updataClient(Client client){
        clientService.updatClient(client);
        return "redirect:/pages/homepage.jsp";
    }

    //分页
    @RequestMapping("/findClient")
    @ResponseBody
    public PageBean findClient(PageBean bean){
        return clientService.findClientList(bean);
    }

    //删除
    @RequestMapping("/deleteClient")
    @ResponseBody
    public boolean deleteClient(int[] cno){
        return clientService.delete(cno);
    }

    //统计客户与订单信息
    @RequestMapping("/clientiAndIndent")
    @ResponseBody
    public List clientiAndIndent(){
        return clientService.statisticsClientiIndent();
    }

    public void setClientService(IClientService clientService) {
        this.clientService = clientService;
    }
}
