package com.schoolmates.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.schoolmates.model.SchoolmateOrganize;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * SchoolmateOrganizeAddNewsIndexController
 * @author Guozhu Zhu
 * @date 2017/12/23
 * @version 1.0
 *
 */
public class SchoolmateOrganizeAddNewsIndexController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	

	public Connection conn = null;
	
    public java.sql.PreparedStatement ps = null;
    
    public java.sql.ResultSet rs = null;
    
    public int rs1 ;
    
    public SqlConnectionUtil sqlUtil = null;
    
    public SchoolmateOrganize organize = null;
	
	public void init(ServletConfig conf) throws ServletException {
		super.init(conf);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.reset(); 
		response.setContentType("text/html;charset=utf-8"); 
		PrintWriter pw = response.getWriter(); 
		request.setCharacterEncoding("UTF-8");
	    organize = new SchoolmateOrganize();
	    organize.setContent(request.getParameter("content"));
	    organize.setTitle(request.getParameter("title"));
	    organize.setFirstIndex(request.getParameter("firstIndexNumber"));
	    organize.setIndexTitle(request.getParameter("indexTitle"));
	   try {
	        	SqlConnectionUtil.init();
	            conn = SqlConnectionUtil.getConnection();
	            String sql="insert into schoolmate_organize(title,content,indexTitle,firstIndex,deleted)values('"+organize.getTitle()+"','"+organize.getContent()+"','"+organize.getIndexTitle()+"','"+organize.getFirstIndex()+"',0)";
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
	            if(conn != null){
	                try {
	                    conn.close();
	                } catch (Exception e2) {
	                    e2.printStackTrace();
	                }
	            }
	            if(ps != null){
	                try {
	                    ps.close();
	                } catch (Exception e2) {
	                    e2.printStackTrace();
	                }
	            }
	        }
	}
	
}
