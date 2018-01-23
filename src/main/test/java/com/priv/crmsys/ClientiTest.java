package com.priv.crmsys;

import com.priv.crmsys.dao.impl.ClientDao;
import junit.framework.TestCase;

import java.util.List;

/**
 * Created by Administrator on 2018/1/22.
 */
public class ClientiTest extends TestCase {

    ClientDao clientDao = new ClientDao();

    public void test_findClientList(){
        List list=clientDao.findClientList("from Client");
        System.out.println(list.size());
    }


}
