package com.priv.crmsys.service.impl;


import com.priv.crmsys.convertion.PageBean;
import com.priv.crmsys.dao.IClientDao;
import com.priv.crmsys.entity.Client;
import com.priv.crmsys.service.IClientService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/11/6.
 */
@Service("clientService")
@Transactional(propagation = Propagation.REQUIRED)
public class ClientService implements IClientService {


    @Resource(name="clientiDao")
    private IClientDao chientiDao;

    //添加用户
    @Override
    public Client addClient(Client client) {
        return chientiDao.addClient(client);
    }

    //分页查询
    @Override
    public PageBean findClientList(PageBean bean) {
        //默认HQL语句
        String hql = "from Client  ";

        //执行查询获取当前页要显示的数据
        bean.setData(chientiDao.findClientList(hql, bean));
        //获取总的数据条数
        bean.setCount(chientiDao.findClientList(hql).size());
        return bean;
    }





    //删除
    @Override
    public boolean delete(int[] id) {
        if(id!=null&&id.length>0){
            Client client = new Client();
            for (int i:id){
                client.setCno(i);
                chientiDao.deleteClient(client);
                return true;
            }
        }
        return false;
    }

    @Override
    public List findClientList() {
        return chientiDao.findClientList("from Client c where c.cstart=1");
    }

    //客户修改
    @Override
    public boolean updatClient(Client client) {
        return chientiDao.updateClient(client);
    }

    @Override
    public List statisticsClientiIndent() {
        String sql = "select c.cname,SUM(o.ogathering),COUNT(*) from tb_chient c , tb_orderdetails o where c.cno=o.ocno and o.ostate=1 GROUP BY c.cname ";
        return chientiDao.statisticsClientiIndent(sql);
    }


    public void setChientiDao(IClientDao chientiDao) {
        this.chientiDao = chientiDao;
    }
}
