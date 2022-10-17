<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Complaint</title>
</head>
<body>
	<form action="add-complaint.jsp">
		<input type="text" name="complaintType" placeholder="Complaint Type" /><br><br>
		<input type="text" name="cDescription" placeholder="Complaint Description" /><br><br>
		<input type="text" name="severity" placeholder="Complaint Severity" /><br><br>
		<input type="submit" value="SUBMIT" />
	</form>
	
	<c:if test="${param.complaintType != null }">
		<jsp:include page="connection.jsp"></jsp:include>
		<sql:query var="compId" dataSource="${conn}">
			SELECT ComplaintID FROM Complaint ORDER BY ComplaintID DESC LIMIT 1
		</sql:query>
		<c:set var="id" value="${compId.rows[0].complaintId }" />
		
		<%
			String id = (String)pageContext.getAttribute("id");
			String complaintId = "C" + String.format("%03d", Integer.parseInt(id.substring(1))+1);
			pageContext.setAttribute("complaintId", complaintId);
			
		%>
		
		<sql:update var="updateQuery" dataSource="${conn }">Insert into complaint (ComplaintID, ComplaintType, CDescription, Severity, Status) values(?, ?, ?, ?, ?)
			<sql:param value="${complaintId }" />
			<sql:param value="${param.complaintType }" />
			<sql:param value="${param.cDescription }" />
			<sql:param value="${param.severity }" />
			<sql:param value="PENDING" />
		</sql:update>
		<jsp:forward page="show-complains.jsp" />
	</c:if>
</body>
</html>