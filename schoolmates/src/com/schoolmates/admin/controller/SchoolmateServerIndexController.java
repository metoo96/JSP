package com.schoolmates.admin.controller;

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
import com.schoolmates.model.SchoolmateServer;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * SchoolmateServerIndexController
 * @author Guozhu Zhu
 * @date 2017/12/23
 * @version 1.0
 *
 */
public class SchoolmateServerIndexController extends HttpServlet{

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
		String page = request.getParameter("page") == null ? "1" : request.getParameter("page");
		Integer p = (Integer.parseInt(page)-1);
		//起始索引位置
		Integer start = (p*10);
        try {
        	SqlConnectionUtil.init();
            conn = SqlConnectionUtil.getConnection();
            String sql="select*from schoolmate_server limit "+start+", 10";
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            List<SchoolmateServer> newslist= new ArrayList<SchoolmateServer>();
            SchoolmateServer news=null;
            while(rs.next()){
                news=new  SchoolmateServer();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setDate(rs.getString("date"));
                news.setAuthor(rs.getString("author"));
                news.setTime(rs.getString("time"));
                news.setListIndex(rs.getInt("listIndex"));
                news.setListTitle(rs.getString("listTitle"));
                System.out.println(news.toString());
                newslist.add(news);
            }
            request.setAttribute("newslist", newslist);
            request.setAttribute("page", p+1);
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Admin/SchoolmateServer/index.jsp");
		dispatcher.forward(request, response);
	}

}
