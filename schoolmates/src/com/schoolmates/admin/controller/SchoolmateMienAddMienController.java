package com.schoolmates.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.schoolmates.model.SchoolmateActivity;
import com.schoolmates.model.SchoolmateMien;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * SchoolmateMienAddMienController
 * @author Guozhu Zhu
 * @date 2017/12/24
 * @version 1.0
 *
 */
public class SchoolmateMienAddMienController extends HttpServlet{

	
	   private static final long serialVersionUID = 1L;
	
	   public Connection conn = null;
		
	    public java.sql.PreparedStatement ps = null;
	    
	    public int rs = 0;
	    
	    public SqlConnectionUtil sqlUtil = null;
	    
	    public SchoolmateMien news = null;
		
		public void init(ServletConfig conf) throws ServletException {
			super.init(conf);
		}
		
		public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
			response.reset(); 
			response.setContentType("text/html;charset=utf-8"); 
			PrintWriter pw = response.getWriter(); 
			request.setCharacterEncoding("UTF-8");
			String htmlData = request.getParameter("content") != null ? request.getParameter("content") : "";
			news = new SchoolmateMien();
			news.setName(request.getParameter("name"));
			news.setContent(htmlData);
			news.setGrade(request.getParameter("grade"));
			news.setSubject(request.getParameter("subject"));
			news.setDescription(request.getParameter("description"));
			
			System.out.println(htmlData);
			   try {
		        	SqlConnectionUtil.init();
		            conn = SqlConnectionUtil.getConnection();
		            String sql="insert into mien(name,content,grade,subject,description,head_url)values('"+news.getName()+"','"+news.getContent()+"','"+news.getGrade()+"','"+news.getSubject()+"','"+news.getDescription()+"','default')";
		            ps=conn.prepareStatement(sql);
		            rs=ps.executeUpdate();
		            if (rs == 0) {
		            	pw.print("no"); 
		        		pw.flush(); 
		        		pw.close();
		            } else {
		            	pw.print("ok"); 
		        		pw.flush(); 
		        		pw.close();
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }finally{
		            if(conn !=null){
		                try {
		                    conn.close();
		                } catch (Exception e2) {
		                    e2.printStackTrace();
		                }
		            }
		            if(ps !=null){
		                try {
		                    ps.close();
		                } catch (Exception e2) {
		                    e2.printStackTrace();
		                }
		            }
		        }
		}
		
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Admin/SchoolmateActivity/index.jsp");
			dispatcher.forward(request, response);
		}

}
