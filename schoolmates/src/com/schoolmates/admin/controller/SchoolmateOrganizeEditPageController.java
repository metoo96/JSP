package com.schoolmates.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.schoolmates.model.News;
import com.schoolmates.model.SchoolmateOrganize;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * SchoolmateOrganizeEditPageController
 * @author Guozhu Zhu
 * @date 2017/12/22
 * @version 1.0
 *
 */
public class SchoolmateOrganizeEditPageController extends HttpServlet{

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
	    organize.setId(Integer.parseInt(request.getParameter("id")));
	    organize.setContent(request.getParameter("content"));
	    organize.setTitle(request.getParameter("title"));
	    organize.setFirstIndex(request.getParameter("firstIndex"));
	    organize.setIndexTitle(request.getParameter("indexTitle"));
		   try {
	        	SqlConnectionUtil.init();
	            conn = SqlConnectionUtil.getConnection();
	            String sql="update schoolmate_organize set title='"+organize.getTitle()+"',content='"+organize.getContent()+"',indexTitle='"+organize.getIndexTitle()+"',firstIndex='"+organize.getFirstIndex()+"' where id ="+organize.getId();
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
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  try {
	        	SqlConnectionUtil.init();
	            conn = SqlConnectionUtil.getConnection();
	            String sql="select*from schoolmate_organize where id="+request.getParameter("id");
	            ps=conn.prepareStatement(sql);
	            rs=ps.executeQuery();
	            List<SchoolmateOrganize> newslist= new ArrayList<SchoolmateOrganize>();
	            String firstIndexName = null;
	            while(rs.next()){
	                organize = new SchoolmateOrganize();
	                organize.setId(rs.getInt("id"));
	                organize.setContent(rs.getString("content"));
	                organize.setTitle(rs.getString("title"));
	                organize.setDeleted(rs.getInt("deleted"));
	                organize.setIndexTitle(rs.getString("indexTitle"));
	                organize.setFirstIndex(rs.getString("firstIndex"));
	                switch (rs.getString("firstIndex")) {
	                case "0":
	        			firstIndexName = "会长致辞";
	        		break;
	        		case "1":
	        			firstIndexName = "地方校友会";
	        		break;
	        		case "2":
	        			firstIndexName = "院系分会";
	        		break;
	        		case "3":
	        			firstIndexName = "组织章程";
	        		break;
	                }
	                System.out.println(organize.toString());
	                newslist.add(organize);
	            }
	          
	            request.setAttribute("newslist", newslist);
	            request.setAttribute("firstIndexName", firstIndexName);
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
	            if(rs !=null){
	                try {
	                    rs.close();
	                } catch (Exception e2) {
	                    e2.printStackTrace();
	                }
	            }
	        }
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Admin/SchoolmateOrganize/editPage.jsp");
			dispatcher.forward(request, response);
		}
		
	
}
