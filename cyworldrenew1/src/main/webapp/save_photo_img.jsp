<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>  
<%@ include file="dbconn.jsp" %>
<%@ page import=" java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat" %>


<%  
	request.setCharacterEncoding("UTF-8");
 
	String filename = "";
	String realFolder = request.getSession().getServletContext().getRealPath("/userprofileimg"); //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
 
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String user_id = (String)session.getAttribute("sessionId");
	String photo_url = multi.getParameter("photo_url");
	String photo_contents = multi.getParameter("photo_contents");
	photo_contents = photo_contents.replace("\r\n","<br>");
	Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = sdf.format(timestamp);
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	int number = 0;
	PreparedStatement pstmt = null;	
	
	String sql = "insert into photo values(?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, number);
	pstmt.setString(2, user_id);
	pstmt.setString(3, fileName);
	pstmt.setString(4, photo_contents);
	pstmt.setString(5, formattedDate);

	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();

%>
<script>
alert("미니홈페이지 제목이 수정되었습니다");
history.go(-1);

</script>
