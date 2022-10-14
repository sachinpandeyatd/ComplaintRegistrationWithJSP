<%@page import="com.complaint_register.ComplaintDAO"%>
<%@page import="com.complaint_register.Complaint"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADD Complaint</title>
</head>
<body>
	<form action="add-complaint.jsp">
		<input type="text" name="complaintType" placeholder="Complaint Type" /><br>
		<input type="text" name="cDescription" placeholder="Complaint Description" /><br>
		<input type="text" name="severity" placeholder="Complaint Severity" /><br>
		<input type="submit" value="SUBMIT" />
	</form>
	
	<%
		if(request.getParameter("complaintType") != null){
			Complaint complaint = new Complaint();
			complaint.setComplaintType(request.getParameter("complaintType"));
			complaint.setcDescription(request.getParameter("cDescription"));
			complaint.setSeverity(request.getParameter("severity"));
			
			out.println(new ComplaintDAO().addComplaint(complaint));
		}
	%>
</body>
</html>