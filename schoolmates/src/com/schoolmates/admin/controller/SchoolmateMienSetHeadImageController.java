package com.schoolmates.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mysql.jdbc.Connection;
import com.schoolmates.model.SchoolmateMien;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * SchoolmateMienSetHeadImageController
 * @author Guozhu Zhu
 * @date 2017/12/24
 * @version 1.0
 *
 */
public class SchoolmateMienSetHeadImageController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public Connection conn = null;
	
    public java.sql.PreparedStatement ps = null;
    
    public java.sql.ResultSet rs = null;
    
    public int rs1;
    
    public SqlConnectionUtil sqlUtil = null;
    
    public SchoolmateMien news = null;
    
    // ���峣��,�����ļ�·��
    private static final String FILE_PATH = "F:" + File.separator + "schoolmates"
                + File.separator + "upload" + File.separator;// �ļ��ϴ���·��
    
    private static final String FILE_TEMP = "F:" + File.separator + "schoolmates"
                + File.separator + "temp" + File.separator;;// �ļ�����·��

    // �ϴ�����
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
 
	public void init(ServletConfig conf) throws ServletException {
		super.init(conf);
	}
	
	/**
     * �ϴ����ݼ������ļ�
     */
    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
        // ����Ƿ�Ϊ��ý���ϴ�
        if (!ServletFileUpload.isMultipartContent(request)) {
            // ���������ֹͣ
            PrintWriter writer = response.getWriter();
            writer.println("Error: ��������� enctype=multipart/form-data");
            writer.flush();
            return;
        }

        // �����ϴ�����
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // �����ڴ��ٽ�ֵ - �����󽫲�����ʱ�ļ����洢����ʱĿ¼��
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // ������ʱ�洢Ŀ¼
        File fileTemp = new File(FILE_TEMP);
        if (!fileTemp.exists()){
          fileTemp.mkdirs();
        }
        
        File localDir = new File(FILE_PATH);
        if (!localDir.exists()) {
             localDir.mkdir();
        }
        // ������ʱ�洢Ŀ¼
        factory.setRepository(fileTemp);
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // ��������ļ��ϴ�ֵ
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // �����������ֵ (�����ļ��ͱ�����)
        upload.setSizeMax(MAX_REQUEST_SIZE);
        
        // ���Ĵ���
        upload.setHeaderEncoding("UTF-8"); 

        // ������ʱ·�����洢�ϴ����ļ�
        // ���·����Ե�ǰӦ�õ�Ŀ¼
        // String uploadPath = getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
        // ���Ŀ¼�������򴴽�
 
        try {
            // ���������������ȡ�ļ�����
            List<FileItem> formItems = upload.parseRequest(request);
            String filePath = null;
            String value = null;
            String fileName = null;
            //����һ��ͨ��Ψһʶ���
            String uuid = UUID.randomUUID().toString(); 
            String uniqueId = uuid.replaceAll("-", "");
            if (formItems != null && formItems.size() > 0) {
                // ����������
                for (FileItem item : formItems) {
                    // �����ڱ��е��ֶ�
                    if (!item.isFormField()) {
                        fileName = new File(item.getName()).getName();
                        fileName = uniqueId+fileName;
                        filePath = FILE_PATH + File.separator + fileName;
                        File storeFile = new File(filePath);
                        // �ڿ���̨����ļ����ϴ�·��
                        System.out.println(filePath);
                       
                        // �����ļ���Ӳ��
                        item.write(storeFile);
                    } else {
                    	  String name = item.getFieldName();
                         //�����ͨ����������ݵ�������������
                         value = item.getString("UTF-8");
                          //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                          System.out.println(name + "=" + value);
                          
                    }
                }
            
                        news = new SchoolmateMien();
                        news.setHead_url(fileName);
                        news.setId(Integer.parseInt(value));
                    	   try {
                            	SqlConnectionUtil.init();
                                conn = SqlConnectionUtil.getConnection();
                                String sql="update mien set head_url='"+news.getHead_url()+"' where id="+news.getId();
                                ps=conn.prepareStatement(sql);
                                rs1=ps.executeUpdate();
                                if (rs1 == 0) {
                                	request.setAttribute("message",
                                            "�ļ��ϴ�ʧ��!");
                                } else {
                                	request.setAttribute("message",
                                            "�ļ��ϴ��ɹ�!");
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
        } catch (Exception ex) {
            request.setAttribute("message",
                    "������Ϣ: " + ex.getMessage());
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/message.jsp");
		dispatcher.forward(request, response);
    }
    
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page") == null ? "1" : request.getParameter("page");
		Integer p = (Integer.parseInt(page)-1);
		//��ʼ����λ��
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Admin/SchoolmateMien/setHeadImage.jsp");
		dispatcher.forward(request, response);
	}

}
