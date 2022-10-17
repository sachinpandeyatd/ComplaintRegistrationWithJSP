<%@page import="com.complaint_register.ComplaintDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.complaint_register.Complaint"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Complains</title>
</head>
<body>
	<table border=3>
		<tr>
			<th>ID</th>
			<th>Type</th>
			<th>Description</th>
			<th>Date</th>
			<th>Severity</th>
			<th>Status</th>
			<th>Resolve</th>
		</tr>
		<%
			List<Complaint> complaintList = new ArrayList<Complaint>();
			complaintList = new ComplaintDAO().showComplains();
			for(Complaint complaint : complaintList){
		%>
		<tr>
			<td><%=complaint.getId() %></td>
			<td><%=complaint.getComplaintType() %></td>
			<td><%=complaint.getcDescription() %></td>
			<td><%=complaint.getComplaintDate() %></td>
			<td><%=complaint.getSeverity() %></td>
			<td><%=complaint.getStatus() %></td>
			<td><a href="resolve-complaint.jsp?complaintId=<%=complaint.getId() %>"><button>Resolve</button></a></td>
		</tr>
		<% } %>
	</table>
</body>
</html>