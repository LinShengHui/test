package com.priv.crmsys.interceptor;

import com.priv.crmsys.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 登陆过滤器
 * Created by Administrator on 2017/11/13.
 */
@WebFilter("/*")
public class LoginFilter implements Filter {

    //初始化
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("初始化");
    }


    //定义放行的Url
    String[] allUrl={"index.jsp","/css/","/js/","/images/","/layui/","/userAction/userLogin","/userActionTest","chientAction/findClient"};
    @Override
    public void doFilter(ServletRequest Request, ServletResponse Response, FilterChain Chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) Request;
        HttpServletResponse response = (HttpServletResponse) Response;

        //获取请求的Url
        String url = request.getServletPath();
        //遍历定义的Url判断是否放行
        for (String goUrl : allUrl){
            if(url.contains(goUrl)){
                Chain.doFilter(request,response);
                return;
            }
        }

        //如果需要登陆验证
        User userName = (User) request.getSession().getAttribute("user");
        if(userName==null){
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script>alert('请先登陆');location.href='"+request.getContextPath()+"/index.jsp';</script>");
            out.close();
        }else{
            Chain.doFilter(request,response);
        }


    }

    @Override
    public void destroy() {
        System.out.println("结束");
    }
}
