package com.schoolmates.model;

/**
 * SchoolmateOrganize(学校组织)
 * @author Guozhu Zhu
 * @date 2017/12/22
 * @version 1.0
 *
 */
public class SchoolmateOrganize {
	
	public int id;
	
	public String title;
	
	public String content;
	
	public String firstIndex;
	
	public String indexTitle;
	
	public int deleted;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(String firstIndex) {
		this.firstIndex = firstIndex;
	}

	public String getIndexTitle() {
		return indexTitle;
	}

	public void setIndexTitle(String indexTitle) {
		this.indexTitle = indexTitle;
	}

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
    
	public SchoolmateOrganize() {
		
	}
	
	public SchoolmateOrganize(int id, String title, String content, String firstIndex, String indexTitle, int deleted) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.firstIndex = firstIndex;
		this.indexTitle = indexTitle;
		this.deleted = deleted;
	}

}
