package com.schoolmates.model;

/**
 * SchoolmatePublish
 * @author Guozhu Zhu
 * @date 2017/12/24
 * @version 1.0
 *
 */
public class SchoolmatePublish {
	
	public int id;
	
	public int deleted;
	
	public String head_image;
	
	public String src;
	
	public String download_url;
	
	public int is_only_download;
	
	public String title;
    
	public SchoolmatePublish() {
		
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	public String getHead_image() {
		return head_image;
	}

	public void setHead_image(String head_image) {
		this.head_image = head_image;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getDownload_url() {
		return download_url;
	}

	public void setDownload_url(String download_url) {
		this.download_url = download_url;
	}

	public int getIs_only_download() {
		return is_only_download;
	}

	public void setIs_only_download(int i) {
		this.is_only_download = i;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public SchoolmatePublish(int id, int deleted, String head_image, String src, String download_url,
			int is_only_download, String title) {
		super();
		this.id = id;
		this.deleted = deleted;
		this.head_image = head_image;
		this.src = src;
		this.download_url = download_url;
		this.is_only_download = is_only_download;
		this.title = title;
	}

}
