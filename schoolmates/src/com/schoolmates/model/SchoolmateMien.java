package com.schoolmates.model;

/**
 * SchoolmateMien(–£”—√˚»À)
 * @author Guozhu Zhu
 * @date 2017/12/24
 * @version 1.0
 *
 */
public class SchoolmateMien {
	
	public int id;
	
	public String name;
	
	public String description;
	
	public String content;
	
	public int deleted;
	
	public String click_count;
	
	public int is_show;
	
	public String head_url;
	
	public String grade;
	
	public String subject;
    
	public SchoolmateMien() {
		
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public String getClick_count() {
		return click_count;
	}

	public void setClick_count(String click_count) {
		this.click_count = click_count;
	}

	public int getIs_show() {
		return is_show;
	}

	public void setIs_show(int is_show) {
		this.is_show = is_show;
	}

	public String getHead_url() {
		return head_url;
	}

	public void setHead_url(String head_url) {
		this.head_url = head_url;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public SchoolmateMien(int id, String name, String description, String content, int deleted, String click_count,
			int is_show, String head_url, String grade, String subject) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.content = content;
		this.deleted = deleted;
		this.click_count = click_count;
		this.is_show = is_show;
		this.head_url = head_url;
		this.grade = grade;
		this.subject = subject;
	}

}
