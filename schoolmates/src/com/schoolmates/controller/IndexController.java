package com.schoolmates.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * IndexController
 * @author Guozhu Zhu
 * @date 2017/12/21
 * @version 1.0
 */

public class IndexController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//response.sendRedirect("jsp/Admin/Login/index.jsp");//÷ÿ∂®œÚ
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/Admin/Login/index.jsp");
		dispatcher.forward(request, response);
	}

}
