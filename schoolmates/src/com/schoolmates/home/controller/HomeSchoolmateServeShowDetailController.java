package com.schoolmates.home.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.schoolmates.model.SchoolmateServer;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * HomeSchoolmateServeShowDetailController
 * @author Guozhu Zhu
 * @date 2017/12/24
 * @version 1.0
 *
 */
public class HomeSchoolmateServeShowDetailController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public Connection conn = null;
	
    public java.sql.PreparedStatement ps = null;
    
    public java.sql.ResultSet rs = null;
    
    public SqlConnectionUtil sqlUtil = null;
    
	public void init(ServletConfig conf) throws ServletException {
		super.init(conf);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      try {
        	SqlConnectionUtil.init();
            conn = SqlConnectionUtil.getConnection();
            String sql="select*from schoolmate_server where id="+request.getParameter("id");
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            List<SchoolmateServer> newslist= new ArrayList<SchoolmateServer>();
            SchoolmateServer news=null;
            while(rs.next()){
                news=new SchoolmateServer();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setDate(rs.getString("date"));
                news.setListTitle(rs.getString("listTitle"));
                news.setAuthor(rs.getString("author"));
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Home/SchoolmateServe/showDetail.jsp");
		dispatcher.forward(request, response);
	}

}
