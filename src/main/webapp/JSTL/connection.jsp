<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Connection Page</title>
</head>
<body>
<sql:setDataSource var="conn" scope="application"
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/complaint_register"
		user="root"
		password="spatd"
	/>
</body>
</html>