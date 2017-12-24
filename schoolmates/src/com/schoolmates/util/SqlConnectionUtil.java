package com.schoolmates.util;

import java.sql.DriverManager;

import java.sql.SQLException;
import com.mysql.jdbc.Connection;

/**
 * SqlConnectionUtil(数据库连接工具类)
 * @author Guozhu Zhu
 * @date 2017/12/21
 * @version 1.0
 *
 */
public class SqlConnectionUtil {
	public static Connection con;
	public static void init() throws ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
	}
	
	public static Connection getConnection() throws SQLException {
		 String uri ="jdbc:mysql://localhost:3306/db_schoolmates?useUnicode=true&characterEncoding=utf-8";
	     String user = "root";
		 String password = "root";
		 con = (Connection) DriverManager.getConnection(uri, user, password);
		 return con;
	}

}
