package com.schoolmates.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSet;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * AdminLoginIndexController(系统后台登录）
 * @author Guozhu Zhu
 * @date 2017/12/21
 * @version 1.0
 *
 */
public class AdminLoginIndexController extends HttpServlet{


	private static final long serialVersionUID = 1L;
	
	public Connection con;
	
	public SqlConnectionUtil sqlUtil;
	
    public java.sql.ResultSet rs; 
    
    public String passWord;
	
	public void init(ServletConfig conf) throws ServletException {
		super.init(conf);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.reset(); 
		response.setContentType("text/html;charset=utf-8"); 
		PrintWriter pw = response.getWriter(); 
		request.setCharacterEncoding("UTF-8");
		//String htmlData = request.getParameter("content") != null ? request.getParameter("content") : "";
		//System.out.println(htmlData);
		try {
			sqlUtil.init();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con = sqlUtil.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Statement sql;
		//String condition = "insert into student values"+"("+"'"+id+"',"+testBean.getScore()+")";
		String condition = "select*from background_admin where account='"+request.getParameter("account")+"'";
		 try {
			 sql = con.createStatement();
			 rs =  sql.executeQuery(condition);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (rs == null) {
			pw.print("no");
			pw.flush(); 
			pw.close();
		} else {
			   try {
				while (rs.next()) {
					   passWord = rs.getString("password");
					   if (passWord.equals(request.getParameter("password"))) {
						   pw.print("ok"); 
						   pw.flush(); 
						   pw.close();
					   } 
				   }
				pw.print("no");
				pw.flush(); 
				pw.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//response.sendRedirect("/schoolmates/jsp/Admin/Login/index.jsp");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Admin/Login/index.jsp");
		dispatcher.forward(request, response);
	}

}
