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
import com.schoolmates.model.SchoolmateOrganize;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * SchoolmateOrganizeIndexController(显示后台学校组织列表)
 * @author Guozhu Zhu
 * @date 2017/12/22
 * @version 1.0
 *
 */
public class SchoolmateOrganizeIndexController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public Connection conn = null;
	
    public java.sql.PreparedStatement ps = null;
    
    public java.sql.ResultSet rs = null;
    
    public SqlConnectionUtil sqlUtil = null;
    
    public SchoolmateOrganize organize = null;
    
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
            String sql="select*from schoolmate_organize limit "+start+", 10";
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            List<SchoolmateOrganize> newslist= new ArrayList<SchoolmateOrganize>();
            while(rs.next()){
                organize = new SchoolmateOrganize();
                organize.setId(rs.getInt("id"));
                organize.setContent(rs.getString("content"));
                organize.setTitle(rs.getString("title"));
                organize.setDeleted(rs.getInt("deleted"));
                organize.setIndexTitle(rs.getString("indexTitle"));
                organize.setFirstIndex(rs.getString("firstIndex"));
                System.out.println(organize.toString());
                newslist.add(organize);
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Admin/SchoolmateOrganize/index.jsp");
		dispatcher.forward(request, response);
	}
	
}
