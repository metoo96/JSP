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
import com.schoolmates.model.News;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * HomeNewsCenterShowDetailController
 * @author Guozhu Zhu
 * @date 2017/12/24
 * @version 1.0
 *
 */
public class HomeNewsCenterShowDetailController extends HttpServlet{

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
            String sql="select*from news where newsID="+request.getParameter("newsID");
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Home/NewsCenter/showDetail.jsp");
		dispatcher.forward(request, response);
	}

}
