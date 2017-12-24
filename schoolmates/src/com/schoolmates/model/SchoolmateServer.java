package com.schoolmates.model;

/**
 * SchoolmateServer(校友服务实体类)
 * @author Guozhu Zhu 
 * @date 2017/12/23
 * @version 1.0
 *
 */
public class SchoolmateServer {
	
	public int id;
	
	public int listIndex;
	
	public String listTitle;
	
	public String title;
	
	public SchoolmateServer(int id, int listIndex, String listTitle, String title, String author, String date,
			String time, String content, int deleted) {
		super();
		this.id = id;
		this.listIndex = listIndex;
		this.listTitle = listTitle;
		this.title = title;
		this.author = author;
		this.date = date;
		this.time = time;
		this.content = content;
		this.deleted = deleted;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String author;
	
	public String date;
	
	public String time;
	
	public String content;
	
	public int deleted;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getListIndex() {
		return listIndex;
	}

	public void setListIndex(int listIndex) {
		this.listIndex = listIndex;
	}

	public String getListTitle() {
		return listTitle;
	}

	public void setListTitle(String listTitle) {
		this.listTitle = listTitle;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	
	public SchoolmateServer() {
		
	}

	public SchoolmateServer(int id, int listIndex, String listTitle, String author, String date, String time,
			String content, int deleted) {
		super();
		this.id = id;
		this.listIndex = listIndex;
		this.listTitle = listTitle;
		this.author = author;
		this.date = date;
		this.time = time;
		this.content = content;
		this.deleted = deleted;
	}

}
