<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");
String user_id = (String) session.getAttribute("sessionId");
String file_name1 = request.getParameter("file_name");
int price1 = Integer.parseInt(request.getParameter("price"));
String contents1 = request.getParameter("contents");



List<String> file_name = (List<String>) session.getAttribute("session_file_name");
List<Integer> price = (List<Integer>) session.getAttribute("session_price");
List<String> contents = (List<String>) session.getAttribute("session_contents");
if(file_name==null&& price==null&& contents==null){
	file_name = new ArrayList<>();
	price = new ArrayList<>();
	contents = new ArrayList<>();
}

file_name.add(file_name1);
price.add(price1);
contents.add(contents1);


if(file_name.size()!=0&&price.size()!=0&&contents.size()!=0){
	%>
	<script type="text/javascript">
	let result = confirm("장바구니에 추가하시겠습니까?")
	    if (result) {
       alert("장바구니에 추가 되었습니다.")
       <%session.setAttribute("session_file_name", file_name);
       session.setAttribute("session_price", price);
       session.setAttribute("session_contents", contents);%>
       window.location.href=  "background_purchase.jsp";
    } else {
    alert("장바구니 추가를 취소하였습니다.")
    window.location.href = "background_purchase.jsp";
    }

</script>
	<%
}else{%>
<script type="text/javascript">
alert("장바구니 추가 실패")
window.location.href = "background_purchase.jsp";
</script>
	<%	
}
%>
