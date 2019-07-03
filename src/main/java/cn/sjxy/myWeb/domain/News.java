package cn.sjxy.myWeb.domain;

public class News {

	private int newsID;
	private String newsTitle;
	private String newsContent;
	private String newsTime;
	private String adminName;
	public int getNewsID() {
		return newsID;
	}
	public void setNewsID(int newsID) {
		this.newsID = newsID;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	public String getNewsTime() {
		return newsTime;
	}
	public void setNewsTime(String newsTime) {
		this.newsTime = newsTime;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	@Override
	public String toString() {
		return "News [newsID=" + newsID + ", newsTitle=" + newsTitle + ", newsContent=" + newsContent + ", newsTime="
				+ newsTime + ", adminName=" + adminName + "]";
	}
	
	
}
