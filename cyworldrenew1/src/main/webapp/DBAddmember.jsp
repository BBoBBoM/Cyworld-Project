<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import=" java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat" %>
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

Timestamp timestamp = new Timestamp(System.currentTimeMillis());
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String formattedDate = sdf.format(timestamp);


String user_background = "outer/backgroundouter.png";
int number =0;
String stock_background_contents="기본이미지";
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
   INSERT INTO user VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)
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
	 <sql:param value = "<%=user_background %>"/>
	 
	<%session.setAttribute("id", id); %>
</sql:update>



<sql:update dataSource="${dataSource}" var="resultSet1">
   INSERT INTO profile (user_id, profile_number, user_introduce_text)
   VALUES (?, ?, ?)
   <sql:param value="<%=id%>" />
   <sql:param value="<%=profile_number%>" />
   <sql:param value="<%=user_introduce_text%>" />
</sql:update>

<sql:update dataSource="${dataSource}" var="resultSet1">
   INSERT INTO user_purchase (user_id, stock_background_file , stock_background_price,stock_background_contents,stock_background_buy_date)
   VALUES (?, ?, ?,?,?)
   <sql:param value="<%=id%>" />
   <sql:param value="<%=user_background%>" />
   <sql:param value="<%=number%>" />
    <sql:param value="<%=stock_background_contents%>" />
 <sql:param value="<%=formattedDate%>" />

</sql:update>

<c:if test="${resultSet>=1 &&resultSet1>=1}">


	<c:redirect url="resultaddmember.jsp?msg=1" />
</c:if>