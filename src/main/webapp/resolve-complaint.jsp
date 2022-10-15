<%@page import="java.sql.Date"%>
<%@page import="com.complaint_register.ComplaintDAO"%>
<%@page import="com.complaint_register.Complaint"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resolve Complaints</title>
</head>
<body>
	<%
		Complaint complain = null;
		if(request.getParameter("complaintId") == null){
	%>
		<form action="">
			<input type="text" name="complaintId" placeholder="ID"><br>
			<input type="submit" value="SUBMIT">
		</form>

		<%
		}
	
		if(request.getParameter("complaintId") != null){
			String complaintId= request.getParameter("complaintId");
			complain = new ComplaintDAO().searchComplaint(complaintId);
		}
	%>
	
	<%
		if(complain != null ){
	%>
		<form action="">
			<input type="text" name="complaintId" value="<%=complain.getId() %>" readonly><br>
			<input type="text" name="complaintDate" value="<%=complain.getComplaintDate()%>" readonly><br>
			<input type="text" name="resolvedBy" placeholder="Resolved By"><br>
			<input type="text" name="comments" placeholder="Comments"><br>
			<input type="submit" value="SUBMIT">
		</form>
	<%
		}
		
		if(request.getParameter("comments") != null){
		
			complain.setId(request.getParameter("complaintId"));
			complain.setComplaintDate(Date.valueOf(request.getParameter("complaintDate")));
			complain.setResolvedBy(request.getParameter("resolvedBy"));
			complain.setComments(request.getParameter("comments"));
			out.println(new ComplaintDAO().resolved(complain));
		}
	%>
</body>
</html>