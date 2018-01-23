package com.priv.crmsys.dao.impl;

import com.priv.crmsys.convertion.PageBean;
import com.priv.crmsys.dao.IClientDao;
import com.priv.crmsys.entity.Client;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/11/6.
 */
@Repository("clientiDao")
public class ClientDao extends BaseDao implements IClientDao {


    //添加一个k辵，返回用户信息
    public Client addClient(Client client){
        return getSession().get(Client.class, getSession().save(client));
    }

    //分页查询客户
    public List findClientList(String hql,PageBean bean){

        Query query=getSession().createQuery(hql);
        //设置分页
        query.setFirstResult((bean.getPage()-1)*bean.getLimit());//从哪里开始查询
        query.setMaxResults(bean.getLimit());//设置每页查询多少条
        //执行查询
        List list=query.list();
        return list;
    }

    public List findClientList(String hql){
        return getSession().createQuery(hql).list();
    }

    @Override
    public boolean deleteClient(Client client) {
        try {
            getSession().delete(client);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    //修改客户
    @Override
    public boolean updateClient(Client client) {
        try {
            getSession().update(client);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List statisticsClientiIndent(String sql) {
        List list =  getSession().createSQLQuery(sql).list();
        return list;
    }


}
