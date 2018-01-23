package com.priv.crmsys.service;

import com.priv.crmsys.convertion.PageBean;
import com.priv.crmsys.entity.Client;

import java.util.List;

/**
 * Created by Administrator on 2017/11/10.
 */
public interface IClientService {
    public Client addClient(Client client);

    public PageBean findClientList(PageBean bean);

    public boolean delete(int[] id);

    public List findClientList();
    //客户修改
    public boolean updatClient(Client client);


    //统计客户与订单
    public List statisticsClientiIndent();
}
