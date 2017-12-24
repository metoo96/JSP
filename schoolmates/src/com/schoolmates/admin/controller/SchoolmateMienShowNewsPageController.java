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
import com.schoolmates.model.SchoolmateMien;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * SchoolmateMienShowNewsPageController
 * @author Guozhu Zhu
 * @date 2017/12/24
 * @version 1.0
 *
 */
public class SchoolmateMienShowNewsPageController extends HttpServlet{

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
            String sql="select*from mien where id="+request.getParameter("id");
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            List<SchoolmateMien> newslist= new ArrayList<SchoolmateMien>();
            SchoolmateMien news=null;
            while(rs.next()){
                news=new  SchoolmateMien();
                news.setId(rs.getInt("id"));
                news.setName(rs.getString("name"));
                news.setContent(rs.getString("content"));
                news.setDescription(rs.getString("description"));
                news.setGrade(rs.getString("grade"));
                news.setSubject(rs.getString("subject"));
                news.setClick_count(rs.getString("click_count"));
                news.setHead_url(rs.getString("head_url"));
                news.setIs_show(rs.getInt("is_show"));
                news.setDeleted(rs.getInt("deleted"));
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Admin/SchoolmateMien/showNewsPage.jsp");
		dispatcher.forward(request, response);
	}

}
