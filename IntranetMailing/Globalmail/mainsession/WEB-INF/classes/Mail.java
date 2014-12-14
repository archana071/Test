package com.santosh.servlets;

public class Mail {
	private String mailid, fromid, subject, sentDate, content,uname;

	public String getFromid() {
		return fromid;
	}
       public String getUname() {
		return uname;
	}

	public void setFromid(String fromid) {
		this.fromid = fromid;
	}

	public String getMailid() {
		return mailid;
	}

	public void setMailid(String mailid) {
		this.mailid = mailid;
	}

	public String getSentDate() {
		return sentDate;
	}

	public void setSentDate(String sentDate) {
		this.sentDate = sentDate;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
