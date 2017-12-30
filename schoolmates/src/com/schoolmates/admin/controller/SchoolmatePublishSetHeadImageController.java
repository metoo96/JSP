package com.schoolmates.admin.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
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
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mysql.jdbc.Connection;
import com.schoolmates.model.SchoolmateMien;
import com.schoolmates.model.SchoolmatePublish;
import com.schoolmates.util.SqlConnectionUtil;

/**
 * SchoolmatePublishSetHeadImageController(����У���ڿ���ͷ��)
 * @author Guozhu Zhu
 * @date 2017/12/24
 * @version 1.0
 *
 */
public class SchoolmatePublishSetHeadImageController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public Connection conn = null;
	
    public java.sql.PreparedStatement ps = null;
    
    public java.sql.ResultSet rs = null;
    
    public int rs1;
    
    public SqlConnectionUtil sqlUtil = null;
    
    public SchoolmatePublish news = null;
    
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
    	 PrintWriter writer;
    	// ����Ƿ�Ϊ��ý���ϴ�
        if (!ServletFileUpload.isMultipartContent(request)) {
            // ���������ֹͣ
            writer = response.getWriter();
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
        
        factory.setRepository(fileTemp);
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // ��������ļ��ϴ�ֵ
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // �����������ֵ (�����ļ��ͱ�����)
        upload.setSizeMax(MAX_REQUEST_SIZE);
        
        // ���Ĵ���
        upload.setHeaderEncoding("UTF-8"); 

        try {
            // ���������������ȡ�ļ�����
            List<FileItem> formItems = upload.parseRequest(request);
            String filePath = null;
            String value = null;
            String fileName = null;
            //����һ��ͨ��Ψһʶ���
            String uuid = UUID.randomUUID().toString(); 
            String uniqueId = uuid.replaceAll("-", "");
            String localFilePath = null;
            if (formItems != null && formItems.size() > 0) {
                // ����������
                for (FileItem item : formItems) {
                    // �����ڱ��е��ֶ�(���Ǵ����ļ�)
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
                   
                        
                        news = new SchoolmatePublish();
                        news.setHead_image(fileName);
                        news.setId(Integer.parseInt(value));
                    	   try {
                            	SqlConnectionUtil.init();
                                conn = SqlConnectionUtil.getConnection();
                                String sql="update schoolmate_publish set head_image='"+news.getHead_image()+"' where id="+news.getId();
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
            String sql="select*from schoolmate_publish where id="+request.getParameter("id");
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            List<SchoolmatePublish> newslist= new ArrayList<SchoolmatePublish>();
            SchoolmatePublish news=null;
            while(rs.next()){
                news=new  SchoolmatePublish();
                news.setId(rs.getInt("id"));
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Admin/SchoolmatePublish/setHeadImage.jsp");
		dispatcher.forward(request, response);
	}

}
