package com.schoolmates.home.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * HomeIndexController
 * @author Guozhu Zhu
 * @date 2017/12/24
 * @version 1.0
 *
 */
public class HomeIndexController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//response.sendRedirect("jsp/Admin/Login/index.jsp");//÷ÿ∂®œÚ
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/Home/Index/index.jsp");
		dispatcher.forward(request, response);
	}

}
