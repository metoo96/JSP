package com.schoolmates.model;

/**
 * News(新闻实体类)
 * @author Guozhu Zhu
 * @date 2017/12/21
 * @version 1.0
 *
 */
public class News {
	
	public int newsID ;
	
	public String title;
    
	public String content;
	
	public String date;
	
	public int clickCount;
	
	public String form;//作者
	
	public String time;

	public int getNewsID() {
		return newsID;
	}

	public void setNewsID(int newsID) {
		this.newsID = newsID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getClickCount() {
		return clickCount;
	}

	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

	public String getForm() {
		return form;
	}

	public void setForm(String form) {
		this.form = form;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
}
