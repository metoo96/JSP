package com.schoolmates.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.schoolmates.model.SchoolmatePublish;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * SchoolmatePublishSetContent1Controller
 * @author Guozhu Zhu 
 * @date 2017/12/24
 * @version 1.0
 *
 */
public class SchoolmatePublishSetContent1Controller extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public Connection conn = null;
	
    public java.sql.PreparedStatement ps = null;
    
    public java.sql.ResultSet rs = null;
    
    public int rs1;
    
    public SqlConnectionUtil sqlUtil = null;
    
    public SchoolmatePublish news = null;
    
	public void init(ServletConfig conf) throws ServletException {
		super.init(conf);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.reset(); 
		response.setContentType("text/html;charset=utf-8"); 
		PrintWriter pw = response.getWriter(); 
		request.setCharacterEncoding("UTF-8");
    	news = new SchoolmatePublish();
		news.setTitle(request.getParameter("download_url"));
		   try {
	        	SqlConnectionUtil.init();
	            conn = SqlConnectionUtil.getConnection();
	            String sql="update schoolmate_publish set download_url='"+news.getDownload_url()+"' where id="+request.getParameter("id");
	            ps=conn.prepareStatement(sql);
	            rs1=ps.executeUpdate();
	            if (rs1 == 0) {
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
	
}
