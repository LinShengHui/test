package com.priv.crmsys.dao;

import com.priv.crmsys.convertion.PageBean;
import com.priv.crmsys.entity.Client;

import java.util.List;

/**
 * Created by Administrator on 2017/11/10.
 */
public interface IClientDao {
    public Client addClient(Client client);

    public List findClientList(String hql,PageBean bean);

    public List findClientList(String hql);
    //删除客户
    public boolean deleteClient(Client client);
    //修改客户
    public boolean updateClient(Client client);

    //统计客户与订单
    public List statisticsClientiIndent(String sql);
}
