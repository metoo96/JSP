package com.schoolmates.model;

/**
 * SchoolmateActivity(校友活动实体类)
 * @author Guozhu Zhu
 * @date 2017/12/23
 * @version 1.0
 *
 */
public class SchoolmateActivity {
	
	public int id;
	
	public String content;
	
	public String title;
	
	public String date;
	
	public String time;
	
	public String author;
	
	public String deleted;
	
	public int clickCount;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
    
	public SchoolmateActivity() {
		
	}
	
	public SchoolmateActivity(int id, String content, String title, String date, String time, String author,
			String deleted, int clickCount) {
		super();
		this.id = id;
		this.content = content;
		this.title = title;
		this.date = date;
		this.time = time;
		this.author = author;
		this.deleted = deleted;
		this.clickCount = clickCount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public int getClickCount() {
		return clickCount;
	}

	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

}
