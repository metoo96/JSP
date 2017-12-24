package com.schoolmates.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * SchoolmateServerDelNewsController
 * @author Guozhu Zhu
 * @date 2017/12/23
 * @version 1.0
 *
 */
public class SchoolmateServerDelNewsController extends HttpServlet{

	private static final long serialVersionUID = 1L;
    

    public Connection conn = null;
	
    public java.sql.PreparedStatement ps = null;
    
    public int rs = 0;
    
    public SqlConnectionUtil sqlUtil = null;
	
	public void init(ServletConfig conf) throws ServletException {
		super.init(conf);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.reset(); 
		response.setContentType("text/html;charset=utf-8"); 
		PrintWriter pw = response.getWriter(); 
		request.setCharacterEncoding("UTF-8");
		   try {
	        	SqlConnectionUtil.init();
	            conn = SqlConnectionUtil.getConnection();
	            String sql="delete from schoolmate_server where id="+request.getParameter("id");
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
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		
	}
}
