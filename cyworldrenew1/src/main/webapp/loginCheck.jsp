<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>  
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");

%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/cyworld"
	driver="com.mysql.jdbc.Driver" user="root" password="1111" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM user WHERE user_id=? and password=?  
    <sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
</sql:query>
<c:forEach var="row" items="${resultSet.rows}">
	<%
		session.setAttribute("sessionId", id);
	%>

	<c:redirect url="resultaddmember.jsp?msg=2" />
</c:forEach>

<c:redirect url="loginerror.jsp?error=1" />
