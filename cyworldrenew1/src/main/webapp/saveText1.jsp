<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.FileWriter" %>
<%@ page import="java.nio.charset.StandardCharsets" %>


<%

request.setCharacterEncoding("utf-8");
String user_id = (String) session.getAttribute("sessionId");
  String text = request.getParameter("filecontent_textarea");
	String filename = user_id + ".txt";

	PrintWriter writer = null;
	try{
		String filePath = application.getRealPath(filename);
		writer = new PrintWriter(filePath);

		writer.println(text);
		out.print("저장되었습니다.");
		
	
}catch(Exception ioe){
	out.println("파일에 데이터를 쓸 수 없습니다");
	out.println(filename);
	out.println(text);
	out.println(user_id);
	ioe.printStackTrace();
	
}finally{
	try{
		writer.close();
	}catch(Exception e){
		
	}}
%>





	






<%=text %>

<%--<%response.sendRedirect("profile.jsp");--%>