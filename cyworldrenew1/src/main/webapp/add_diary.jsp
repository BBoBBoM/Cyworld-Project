<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>

<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>  
<%@ include file="dbconn.jsp" %>
<%  
	request.setCharacterEncoding("UTF-8");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String content = request.getParameter("add_diary");
String date = year +"-"+month + "-" +day;
int number = 0;
	String user_id = (String)session.getAttribute("sessionId");
	
	PreparedStatement pstmt = null;	
	
	String sql = "insert into diary value(?,?,?,?)";

	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, number);
	pstmt.setString(2, user_id);
	pstmt.setString(3, content);
	pstmt.setString(4, date);
	int rs =pstmt.executeUpdate();

	if (pstmt != null)
		{pstmt.close();}
	if (rs ==1){
		%>
	<script type="text/javascript">

		rs.close();
		alert("<%=date%>일기가 등록되었습니다");
		history.go(-1);
		
		</script>
		<%}	


	%>
	



