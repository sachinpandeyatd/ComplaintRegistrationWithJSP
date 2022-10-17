<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resolve Complaint</title>
</head>
<body>
	
	<c:if test="${param.complaintId != null}">
		<jsp:include page="connection.jsp"></jsp:include>
	<sql:query var="complaintQuery" dataSource="${conn}">
		select * from complaint where complaintId=?
		<sql:param value="${param.complaintId}"/>
	</sql:query>
		<c:set var="flag" value="0" />
		<c:forEach var="e" items="${complaintQuery.rows}">
		
			<c:set var="complaintId" value="${e.complaintId }" />
			<c:set var="complaintType" value="${e.complaintType }" />
			<c:set var="complaintDate" value="${e.complaintDate }" />
			
			<form action="resolve-complaint.jsp">
				ID:
				<input type="text" name="complaintId" value="${complaintId }" readonly/> <br><br>
				Type:
				<input type="text" name="complaintType" value="${complaintType }" readonly/><br><br>
				Date:
				<input type="text" name="complaintDate" value="${complaintDate }" readonly/><br><br>
				Resolved By:
				<input type="text" name="resolvedBy" /><br><br>
				Comment:
				<input type="text" name="comments" /><br><br>
				<c:set var="flag" value="1" />
				<input type="submit" value="SUBMIT" />
			</form>
		</c:forEach>
		<c:if test="${flag==0}">
			<c:out value="Complaint NOT Found..." />
		</c:if>
	</c:if>
	
	<c:if test="${param.resolvedBy != null}">
		<jsp:include page="connection.jsp"></jsp:include>

		<c:set var="complaintId" value="${param.complaintId }" />
		<c:set var="complaintDate" value="${param.complaintDate }" />
		<c:set var="resolvedBy" value="${param.resolvedBy }" />
		<c:set var="comments" value="${param.comments }" />
		
		<sql:update var="resolveQuery" dataSource="${conn}">Insert into resolve (ComplaintID, ComplaintDate, ResolvedBy, Comments) values (?, ?, ?, ?)
			<sql:param value="${param.complaintId }"/>
			<sql:param value="${param.complaintDate }"/>
			<sql:param value="${param.resolvedBy }"/>
			<sql:param value="${param.comments }"/>
		</sql:update>
		
		<sql:update var="updateQuery" dataSource="${conn }">Update complaint SET Status="APPROVED" where complaintId=?
			<sql:param value="${param.complaintId }"/>
		</sql:update>
		
		<jsp:forward page="show-complains.jsp" />
	</c:if>
</body>
</html>