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
import com.schoolmates.util.SqlConnectionUtil;

/**
 * SchoolmateResEditNewsController
 * @author Guozhu Zhu
 * @date 2017/12/23
 * @version 1.0
 *
 */
public class SchoolmateResEditNewsController extends HttpServlet{

	private static final long serialVersionUID = 1L;
    
    public Connection conn = null;
	
    public java.sql.PreparedStatement ps = null;
    
    public java.sql.ResultSet rs = null;
    
    public int rs1 ;
    
    public SqlConnectionUtil sqlUtil = null;
    
    public News news = null;
	
	public void init(ServletConfig conf) throws ServletException {
		super.init(conf);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.reset(); 
		response.setContentType("text/html;charset=utf-8"); 
		PrintWriter pw = response.getWriter(); 
		request.setCharacterEncoding("UTF-8");
		Date d = new Date();
		SimpleDateFormat format = new SimpleDateFormat("YY-MM-dd HH:mm:ss");
		String date = format.format(d);
		String htmlData = request.getParameter("content") != null ? request.getParameter("content") : "";
		news = new News();
		news.setNewsID(Integer.parseInt(request.getParameter("newsID")));
		news.setTitle(request.getParameter("title"));
		news.setContent(htmlData);
		news.setForm(request.getParameter("author"));
		news.setDate(date);
		System.out.println(htmlData);
		   try {
	        	SqlConnectionUtil.init();
	            conn = SqlConnectionUtil.getConnection();
	            String sql="update news_schoolmate set title='"+news.getTitle()+"',content='"+news.getContent()+"',form='"+news.getForm()+"',date='"+news.getDate()+"' where newsID ="+news.getNewsID();
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
		String page = request.getParameter("page") == null ? "1" : request.getParameter("page");
        try {
        	SqlConnectionUtil.init();
            conn = SqlConnectionUtil.getConnection();
            String sql="select*from news_schoolmate where newsID="+request.getParameter("newsID");
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            List<News> newslist= new ArrayList<News>();
            News news=null;
            while(rs.next()){
                news=new News();
                news.setNewsID(rs.getInt("newsID"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setDate(rs.getString("date"));
                news.setClickCount(rs.getInt("clickCount"));
                news.setForm(rs.getString("form"));
                news.setTime(rs.getString("time"));
                System.out.println(news.toString());
                newslist.add(news);
            }
            request.setAttribute("newslist", newslist);
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Admin/SchoolmateRes/editNews.jsp");
		dispatcher.forward(request, response);
	}

}
