<%@page import="com.complaint_register.ComplaintDAO"%>
<%@page import="com.complaint_register.Complaint"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Complaint</title>
</head>
<body>
	<form action="search-complaint.jsp">
		<input type="text" name="complaintId" placeholder="Complaint ID" />
		<input type="submit" value="SUBMIT" />
	</form>
	
	<%
		String complaintId = request.getParameter("complaintId");
		
		if(complaintId != null){
			Complaint complaint = new ComplaintDAO().searchComplaint(complaintId);
			
			if(complaint != null){
	%>
			<br><hr><br>
			<table border="3">
				<tr>
					<th>ID</th>
					<th>Type</th>
					<th>Description</th>
					<th>Date</th>
					<th>Severity</th>
					<th>Status</th>
				</tr>
				<tr>
					<td><%=complaint.getId() %></td>
					<td><%=complaint.getComplaintType() %></td>
					<td><%=complaint.getcDescription() %></td>
					<td><%=complaint.getComplaintDate() %></td>
					<td><%=complaint.getSeverity() %></td>
					<td><%=complaint.getStatus() %></td>
				</tr>
			</table>
	<%
			}else{
				out.print("NO complaint found.");
			}
		}
	%>
	
</body>
</html>