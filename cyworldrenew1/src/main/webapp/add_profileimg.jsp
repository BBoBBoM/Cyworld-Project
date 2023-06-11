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

String uploadPath = request.getRealPath("userprofileimg");
	String filename = "";
	String realFolder = "D:\\JSP-workspace\\cyworldrenew1\\src\\main\\webapp\\userprofileimg"; //웹 어플리케이션상의 절대 경로
	String encType = "UTF-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, encType, new DefaultFileRenamePolicy());

	String user_id = (String)session.getAttribute("sessionId");

	Enumeration fileinput = multi.getFileNames();
	String fname = (String) fileinput.nextElement();
	String fileName = multi.getFilesystemName(fname);
	int number = 0;
	PreparedStatement pstmt = null;	
	
	String sql = "UPDATE profile SET user_profile_photo = ? WHERE user_id = ?";
	

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(2, user_id);
	pstmt.setString(1, fileName);
	int rs =pstmt.executeUpdate();

	
	if (pstmt != null)
		{pstmt.close();}
	if (conn != null)
		{conn.close();}
	if (rs ==1){
		%>
	<script type="text/javascript">

	
		alert("프로필 사진이 변경되었습니다");

		</script>
		<%}	
	response.sendRedirect("index.jsp");

	%>
	



