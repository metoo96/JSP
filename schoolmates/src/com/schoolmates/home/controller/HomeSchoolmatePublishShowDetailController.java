package com.schoolmates.home.controller;

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
 * HomeSchoolmatePublishShowDetailController
 * @author Guozhu Zhu
 * @date 2017/12/24
 * @version 1.0
 *
 */
public class HomeSchoolmatePublishShowDetailController extends HttpServlet{

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
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page") == null ? "1" : request.getParameter("page");
		Integer p = (Integer.parseInt(page)-1);
		//起始索引位置
		Integer start = (p*10);
        try {
        	SqlConnectionUtil.init();
            conn = SqlConnectionUtil.getConnection();
            String sql="select*from schoolmate_publish where id="+request.getParameter("id");
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            List<SchoolmatePublish> newslist= new ArrayList<SchoolmatePublish>();
            SchoolmatePublish news=null;
            while(rs.next()){
                news=new  SchoolmatePublish();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setSrc(rs.getString("src"));   
                news.setHead_image(rs.getString("head_image"));
                news.setDownload_url(rs.getString("download_url"));
                news.setIs_only_download(rs.getInt("is_only_download"));
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Home/SchoolmatePublish/showDetail.jsp");
		dispatcher.forward(request, response);
	}

}
