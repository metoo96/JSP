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
import com.schoolmates.model.SchoolmateActivity;
import com.schoolmates.model.SchoolmateMien;
import com.schoolmates.model.SchoolmatePublish;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * HomeIndexSubPageController
 * @author Guozhu Zhu
 * @date 2017/12/24
 * @version 1.0
 *
 */
public class HomeIndexSubPageController extends HttpServlet{

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
            //1新闻模块内容
            String sql1="select*from news limit 0, 7";
            ps=conn.prepareStatement(sql1);
            rs=ps.executeQuery();
            List<News> newslist1= new ArrayList<News>();
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
                newslist1.add(news);
            }
            //2校友活动模块内容
            String sql2="select*from schoolmate_activity limit 0, 7";
            ps=conn.prepareStatement(sql2);
            rs=ps.executeQuery();
            List<SchoolmateActivity> newslist2= new ArrayList<SchoolmateActivity>();
            while(rs.next()){
            	SchoolmateActivity activity = new SchoolmateActivity();
                activity.setId(rs.getInt("id"));
                activity.setContent(rs.getString("content"));
                activity.setTitle(rs.getString("title"));
                activity.setDeleted(rs.getString("deleted"));
                activity.setDate(rs.getString("date"));
                activity.setAuthor(rs.getString("author"));
                activity.setClickCount(rs.getInt("clickCount"));
                activity.setTime(rs.getString("time"));
                System.out.println(activity.toString());
                newslist2.add(activity);
            }
            //3校友资源共享模块
            String sql3="select*from news_schoolmate limit 0, 7";
            ps=conn.prepareStatement(sql3);
            rs=ps.executeQuery();
            List<News> newslist3= new ArrayList<News>();
            News news1=null;
            while(rs.next()){
                news1=new News();
                news1.setNewsID(rs.getInt("newsID"));
                news1.setTitle(rs.getString("title"));
                news1.setContent(rs.getString("content"));
                news1.setDate(rs.getString("date"));
                news1.setClickCount(rs.getInt("clickCount"));
                news1.setForm(rs.getString("form"));
                news1.setTime(rs.getString("time"));
                System.out.println(news1.toString());
                newslist3.add(news1);
            }
            //4校友期刊模块
            String sql4="select*from schoolmate_publish limit 0, 4";
            ps=conn.prepareStatement(sql4);
            rs=ps.executeQuery();
            List<SchoolmatePublish> newslist4= new ArrayList<SchoolmatePublish>();
            SchoolmatePublish news2=null;
            while(rs.next()){
                news2=new  SchoolmatePublish();
                news2.setId(rs.getInt("id"));
                news2.setTitle(rs.getString("title"));
                news2.setSrc(rs.getString("src"));   
                news2.setHead_image(rs.getString("head_image"));
                news2.setDownload_url(rs.getString("download_url"));
                news2.setIs_only_download(rs.getInt("is_only_download"));
                news2.setDeleted(rs.getInt("deleted"));
                System.out.println(news2.toString());
                newslist4.add(news2);
            }
            //5校友风采模块
            String sql5="select*from mien limit 0, 3";
            ps=conn.prepareStatement(sql5);
            rs=ps.executeQuery();
            List<SchoolmateMien> newslist5= new ArrayList<SchoolmateMien>();
            SchoolmateMien news3=null;
            while(rs.next()){
                news3=new  SchoolmateMien();
                news3.setId(rs.getInt("id"));
                news3.setName(rs.getString("name"));
                news3.setContent(rs.getString("content"));
                news3.setDescription(rs.getString("description"));
                news3.setGrade(rs.getString("grade"));
                news3.setSubject(rs.getString("subject"));
                news3.setClick_count(rs.getString("click_count"));
                news3.setHead_url(rs.getString("head_url"));
                news3.setIs_show(rs.getInt("is_show"));
                news3.setDeleted(rs.getInt("deleted"));
                System.out.println(news3.toString());
                newslist5.add(news3);
            }
            request.setAttribute("newslist1", newslist1);
            request.setAttribute("newslist2", newslist2);
            request.setAttribute("newslist3", newslist3);
            request.setAttribute("newslist4", newslist4);
            request.setAttribute("newslist5", newslist5);
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Home/Index/subPage.jsp");
		dispatcher.forward(request, response);
	}

}
