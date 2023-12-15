package Board;

import java.sql.Date;

public class BoardDTO {
	private String UserID;
	private String Title;
	private String Update;
	private String Content;
	private Date Date;
	
	public String getUpdate() {
		return Update;
	}

	public void setUpdate(String update) {
		Update = update;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getUserID() {
		return UserID;
	}

	public void setUserID(String userID) {
		UserID = userID;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public Date getDate() {
		return Date;
	}

	public void setDate(Date date) {
		this.Date = date;
	}

}
