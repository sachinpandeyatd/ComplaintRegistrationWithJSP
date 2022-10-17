
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Resolved</title>
</head>
<body>
	<jsp:include page="connection.jsp" />
	<sql:query var="resolveQuery" dataSource="${conn}">select * from resolve</sql:query>
	<table border="3">
		<tr>
			<th>ID</th>
			<th>Complaint Date</th>
			<th>Resolved Date</th>
			<th>Resolved By</th>
			<th>Comment</th>
			<th>TAT</th>
		</tr>
		<c:forEach var="resolve" items="${resolveQuery.rows }">
			<c:set var="complaintDate" value="${resolve.complaintDate}" />
			<c:set var="resolveDate" value="${resolve.resolveDate}" />
			<%
				Timestamp x = (Timestamp)pageContext.getAttribute("complaintDate");
				Timestamp y = (Timestamp)pageContext.getAttribute("resolveDate");
				Date today= Date.valueOf(x.toLocalDateTime().toLocalDate());
				Date today1= Date.valueOf(y.toLocalDateTime().toLocalDate());
				long day1=today1.getTime()-today.getTime();
			 	long m = day1 / (1000 * 24 * 60 * 60);
				int tat=(int)m;
				pageContext.setAttribute("tat", tat);
			%>
			<tr>
				<td><c:out value="${resolve.complaintId }"></c:out></td>
				<td><c:out value="${resolve.complaintDate }"></c:out></td>
				<td><c:out value="${resolve.resolveDate }"></c:out></td>
				<td><c:out value="${resolve.resolvedBy }"></c:out></td>
				<td><c:out value="${resolve.comments }"></c:out></td>
				<td><c:out value="${tat }"></c:out></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>