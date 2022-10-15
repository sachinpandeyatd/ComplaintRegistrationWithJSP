<%@page import="com.complaint_register.ComplaintDAO"%>
<%@page import="com.complaint_register.Complaint"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Show Resolved Complaints</title>
		<style>
			#pink{
				background-color:#Ffc0cb;
			}
			#red{
				background-color:red;
			}
		</style>
	</head>
	<body>
		<table border="3">
			<tr>
			<th>ComplaintID</th>
			<th>ComplaintDate</th>
			<th>ResolveDate</th>
			<th>ResolvedBy</th>
			<th>Comments</th>
			<th>TAT</th>
		</tr>
		
		<%
		ComplaintDAO dao=new ComplaintDAO();
		Complaint[] ComplainArray  = dao.showResolved();
		
		for(Complaint c : ComplainArray){
			int tat=c.getTat();
		%>
			<tr>
				<td><%=c.getId() %></td>
				<td><%=c.getComplaintDate() %></td>
				<td><%=c.getResolveDate() %></td>
				<td><%=c.getResolvedBy() %></td>
				<td><%=c.getComments() %></td>
				<%
					if(7<=tat && tat<=10)	{
							
				%>
				
				<td id="pink"><%=c.getTat() %></td>
				
				<% } else if(tat>10) { %>
				
				<td id="red"><%=c.getTat() %></td>
				
				<% } else { %>
			
				<td><%=c.getTat() %></td>
				
				<% } %>
			</tr>
		<% } %>
		</table>
	</body>
</html>