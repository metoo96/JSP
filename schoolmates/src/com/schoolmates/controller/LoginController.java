package com.schoolmates.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse res) throws IOException {
		//HttpServletResponse res = ServletActionContext.getResponse(); 
		res.reset(); 
		res.setContentType("text/html;charset=utf-8"); 
		PrintWriter pw = res.getWriter(); 
	//	AjaxResult rs = new  AjaxResult("ok", "ok", 200);
		request.setCharacterEncoding("UTF-8");
		String htmlData = request.getParameter("content") != null ? request.getParameter("content") : "";
		System.out.println(htmlData);
		pw.print("ok"); 
		pw.flush(); 
		pw.close();
	}


}
