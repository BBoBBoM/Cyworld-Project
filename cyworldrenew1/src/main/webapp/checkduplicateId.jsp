<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp"%>
<%@ page import="java.util.*"%>
<%
String userId = request.getParameter("userId");
PreparedStatement pstmt;
ResultSet rs;
String sql;
boolean duplicate = false;
try {
    sql = "SELECT * FROM user WHERE user_id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, userId);
    rs = pstmt.executeQuery();
    if (rs.next()) {
        duplicate = true;
    }
    rs.close();
    pstmt.close();
    conn.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>