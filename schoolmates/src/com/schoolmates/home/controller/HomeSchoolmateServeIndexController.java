package com.schoolmates.home.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * HomeSchoolmateServeIndexController
 * @author Guozhu Zhu
 * @date 2017/12/24
 * @version 1.0 
 *
 */
public class HomeSchoolmateServeIndexController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	

	public void init(ServletConfig conf) throws ServletException {
		super.init(conf);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Home/SchoolmateServe/index.jsp");
		dispatcher.forward(request, response);
	}


}
