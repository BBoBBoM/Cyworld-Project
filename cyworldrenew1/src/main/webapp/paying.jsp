<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ include file="dbconn.jsp"%>
<%@ page import=" java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat" %>



<%
request.setCharacterEncoding("UTF-8");
String user_id = (String)session.getAttribute("sessionId");
List<String> file_name = (List<String>)session.getAttribute("session_file_name");
List<Integer> price =(List<Integer>)session.getAttribute("session_price");
List<String> contents =(List<String>)session.getAttribute("session_contents");

String allprice = request.getParameter("all_price");
int all_price = Integer.parseInt(allprice);
int dotori=0;

Timestamp timestamp = new Timestamp(System.currentTimeMillis());
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String formattedDate = sdf.format(timestamp);

PreparedStatement pstmt;
String sql = "select * from user where user_id=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, user_id);
ResultSet rs = pstmt.executeQuery();
while(rs.next()){
	dotori = rs.getInt("dotori");
}rs.close();
int remain_dotori= dotori-all_price;
if(remain_dotori<0){
	%>
	<script type="text/javascript">
alert("보유하고 있는 도토리가 모자라요 상품 빼거나 도토리를 충전해주세요~")
history.go(-1);
</script>
	
	<%
	
	
}
else{
for(int i = 0; i <file_name.size();i++){
	String sql1 = "INSERT INTO user_purchase (user_id, stock_background_file, stock_background_price, stock_background_contents, stock_background_buy_date) VALUES (?,?,?,?,?)";
pstmt= conn.prepareStatement(sql1);
pstmt.setString(1, user_id);
pstmt.setString(2, file_name.get(i));
pstmt.setString(4, contents.get(i));
pstmt.setInt(3,price.get(i));
pstmt.setString(5, formattedDate);
pstmt.executeUpdate();
}

String sql2 = "update user  set dotori = ? where user_id=?";
pstmt = conn.prepareStatement(sql2);
pstmt.setInt(1, remain_dotori);
pstmt.setString(2, user_id);

int rs1 =pstmt.executeUpdate();

if (pstmt != null)
	{pstmt.close();}
if (rs1 ==1){
	%>
<script type="text/javascript">


	alert("상품구매를 완료했습니다 구매상품은 상품보기란에 있습니다.");
	 <%session.removeAttribute("session_file_name");
	 session.removeAttribute("session_price");
	 session.removeAttribute("session_contents");%>	window.location.href = "background_purchase.jsp";
	</script>
	<%}	

}

	
		


%>