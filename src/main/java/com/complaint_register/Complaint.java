package com.complaint_register;

import java.sql.Date;

public class Complaint {
	private String id;
	private String complaintType;
	private String cDescription;
	private Date complaintDate;
	private String severity;
	private Status status;
	private Date ResolveDate;
	private String ResolvedBy;
	private String Comments;
	private String Severity;
	private int Tat;
	
	
	public Complaint() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Complaint(String id, String complaintType, String cDescription, Date complaintDate, String severity,
			Status status, Date resolveDate, String resolvedBy, String comments, String severity2, int tat) {
		super();
		this.id = id;
		this.complaintType = complaintType;
		this.cDescription = cDescription;
		this.complaintDate = complaintDate;
		this.severity = severity;
		this.status = status;
		ResolveDate = resolveDate;
		ResolvedBy = resolvedBy;
		Comments = comments;
		Severity = severity2;
		Tat = tat;
	}


	@Override
	public String toString() {
		return "Complaint [id=" + id + ", complaintType=" + complaintType + ", cDescription=" + cDescription
				+ ", complaintDate=" + complaintDate + ", severity=" + severity + ", status=" + status
				+ ", ResolveDate=" + ResolveDate + ", ResolvedBy=" + ResolvedBy + ", Comments=" + Comments
				+ ", Severity=" + Severity + ", Tat=" + Tat + "]";
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getComplaintType() {
		return complaintType;
	}


	public void setComplaintType(String complaintType) {
		this.complaintType = complaintType;
	}


	public String getcDescription() {
		return cDescription;
	}


	public void setcDescription(String cDescription) {
		this.cDescription = cDescription;
	}


	public Date getComplaintDate() {
		return complaintDate;
	}


	public void setComplaintDate(Date complaintDate) {
		this.complaintDate = complaintDate;
	}


	public String getSeverity() {
		return severity;
	}


	public void setSeverity(String severity) {
		this.severity = severity;
	}


	public Status getStatus() {
		return status;
	}


	public void setStatus(Status status) {
		this.status = status;
	}	

	public Date getResolveDate() {
		return ResolveDate;
	}
	
	
	public void setResolveDate(Date resolveDate) {
		ResolveDate = resolveDate;
	}
	
	
	public String getResolvedBy() {
		return ResolvedBy;
	}
	
	
	public void setResolvedBy(String resolvedBy) {
		ResolvedBy = resolvedBy;
	}
	
	
	public String getComments() {
		return Comments;
	}
	
	
	public void setComments(String comments) {
		Comments = comments;
	}
	
	
	public int getTat() {
		return Tat;
	}
	
	
	public void setTat(int tat) {
		Tat = tat;
	}
}
