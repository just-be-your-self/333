package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 页面跳转控制器 - 处理前端页面路由
 */
@Controller
public class PageController {

    /**
     * 处理根路径访问，重定向到Vue前端
     */
    @RequestMapping("/")
    public void index(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect(request.getContextPath() + "/admin/dist/index.html");
    }

    /**
     * 处理 /admin 路径访问
     */
    @RequestMapping("/admin")
    public void admin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect(request.getContextPath() + "/admin/dist/index.html");
    }

    /**
     * 处理 /index 路径访问
     */
    @RequestMapping("/index")
    public void indexPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect(request.getContextPath() + "/admin/dist/index.html");
    }
}
