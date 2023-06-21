<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
 
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, encType, new DefaultFileRenamePolicy());

	String user_id = (String)session.getAttribute("sessionId");
	String user_mini_subject = multi.getParameter("usermini_subject");
	String user_basic_info = multi.getParameter("user_introduceself");
	String user_hello_word = multi.getParameter("user_hello_word");
	String user_miniroom_file = null;
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	int number = 0;
	PreparedStatement pstmt = null;	
	
	String sql = "update profile set profile_number=?,user_profile_photo=?, user_mini_subject=?, user_basic_info=?, user_hello_word=?, user_miniroom_file=? where user_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, number);
	pstmt.setString(2, fileName);
	pstmt.setString(3, user_mini_subject);
	pstmt.setString(4, user_basic_info);
    pstmt.setString(5, user_hello_word);
	pstmt.setString(6, user_miniroom_file);
	pstmt.setString(7, user_id);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("add_basicinfo_success.jsp");
	
%>
