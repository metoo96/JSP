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
import com.schoolmates.model.SchoolmateOrganize;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * HomeSchoolmateOrganizeShowDetailController
 * @author Guozhu Zhu
 * @date 2017/12/24
 * @version 1.0
 *
 */
public class HomeSchoolmateOrganizeShowDetailController extends HttpServlet {

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
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Home/SchoolmateOrganize/showDetail.jsp");
			dispatcher.forward(request, response);
		}

}
