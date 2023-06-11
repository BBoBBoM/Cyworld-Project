<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name"); 
String gender = request.getParameter("gender");
String year = request.getParameter("birthyy");
String month = request.getParameterValues("birthmm")[0];
String day = request.getParameter("birthdd");
String birth = year + "/" + month + "/" + day;
String mail1 = request.getParameter("mail1");
String mail2 = request.getParameterValues("mail2")[0];
String mail = mail1 + "@" + mail2;
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String cyworld_URl = "https://cyworld.com/" + id;
Date currentDatetime = new Date(System.currentTimeMillis());
java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());

int number =0;
int user_today_visit = 0;
int user_total_visit = 0;
int profile_number = 0;
String user_introduce_text = "<br>이름 : <br><br>나이 :<br><br>전화번호 : <br><br>성별 : <br><br>주소 : <br><br>";
int dotori = 500;
%>


<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/cyworld"
	driver="com.mysql.jdbc.Driver" user="root" password="1111" />

<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO user VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)
   <sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=mail%>" />
	<sql:param value="<%=birth%>" />
	<sql:param value="<%=gender%>" />
	<sql:param value="<%=phone%>" />
	<sql:param value="<%=address%>" />
	<sql:param value="<%=cyworld_URl%>" />
	<sql:param value="<%=timestamp%>" />
	<sql:param value="<%=dotori%>" />
	 
	 
	<%session.setAttribute("id", id); %>
</sql:update>



<sql:update dataSource="${dataSource}" var="resultSet1">
   INSERT INTO profile (user_id, profile_number, user_introduce_text)
   VALUES (?, ?, ?)
   <sql:param value="<%=id%>" />
   <sql:param value="<%=profile_number%>" />
   <sql:param value="<%=user_introduce_text%>" />
</sql:update>


<c:if test="${resultSet>=1 &&resultSet1>=1}">


	<c:redirect url="resultaddmember.jsp?msg=1" />
</c:if>