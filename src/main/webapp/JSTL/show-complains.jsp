<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show All Complains</title>
</head>
<body>
	<jsp:include page="connection.jsp" />
	<sql:query var="complaintQuery" dataSource="${conn}">select * from complaint</sql:query>
	<table border="3">
		<tr>
			<th>ID</th>
			<th>Type</th>
			<th>Description</th>
			<th>Date</th>
			<th>Severity</th>
			<th>Status</th>
			<th>Resolve</th>
		</tr>
		<c:forEach var="complaint" items="${complaintQuery.rows }">
			<tr>
				<c:set var="complaintId" value="${complaint.complaintId }"></c:set>
				<td><c:out value="${complaintId }"></c:out></td>
				<td><c:out value="${complaint.complaintType }"></c:out></td>
				<td><c:out value="${complaint.cDescription }"></c:out></td>
				<td><c:out value="${complaint.ComplaintDate }"></c:out></td>
				<td><c:out value="${complaint.Severity }"></c:out></td>
				<td><c:out value="${complaint.status }"></c:out></td>
				<c:if test="${complaint.status == 'PENDING' }">
					<td><a href="resolve-complaint.jsp?complaintId=${complaintId }"><button>Resolve</button></a></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</body>
</html>