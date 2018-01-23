package com.priv.crmsys.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 * Created by Administrator on 2017/11/10.
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        System.out.println("---拦截器开始工作-----");
        //获取请求的URL
        String url = request.getRequestURI();
        String allUrl = ("index,addUser");
        System.out.println(url);
        //URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制
        if(url.indexOf("userLogin")>=0){
            return false;
        }
        //获取Session
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("loginName");

        if(username != null){
            return true;
        }
        //不符合条件的，跳转到登录界面
        response.setContentType("text/html;charset=utf-8");
        String path = request.getContextPath();
        PrintWriter out = response.getWriter();
        out.print("<script>alert('请先登陆');location.href='"+path+"/index.jsp';</script>");
        out.close();


        return false;
    }
    /**
     * Handler执行完成之后调用这个方法
     */
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception exc)
            throws Exception {
        System.out.println("----拦截器前-----");

    }

    /**
     * Handler执行之后，ModelAndView返回之前调用这个方法
     */
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("------拦截器后-------");
    }


}
