package com.priv.crmsys.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 * Created by Administrator on 2018/1/11.
 */
public class FileUploading {

    /**
     * 文件上传
     * @param ufiles
     * @param session
     * @return 保存到数据库的路径
     */
    public static String uploading(MultipartFile ufiles, HttpSession session){
        if(!ufiles.isEmpty()){
            //获取放置图片的路径
            String beanPath = session.getServletContext().getRealPath("/images");
            //获取图片名字
            String realName = ufiles.getOriginalFilename();
            try {
                //开始上传
                ufiles.transferTo(new File(beanPath+"/"+realName));
                System.out.println("文件上传路径"+beanPath+"/"+realName);
                //保存路径倒数据库
                String imgUrl = session.getServletContext().getContextPath()+"/images/"+realName;
                return imgUrl;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
