<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");
String user_id = (String) session.getAttribute("sessionId");
ArrayList<String> session_file_name = (ArrayList<String>) session.getAttribute("session_file_name");
ArrayList<Integer> session_price = (ArrayList<Integer>) session.getAttribute("session_price");
ArrayList<String> session_contents = (ArrayList<String>) session.getAttribute("session_contents");
int index = Integer.parseInt(request.getParameter("delete"));



if(session_file_name.size()!=0&&session_price.size()!=0&&session_contents.size()!=0){
	%>
	<script type="text/javascript">
	let result = confirm("장바구니에 추가된 상품 <%=session_contents.get(index)%>  가격 <%=session_price.get(index)%>를 제거하시겠습니까?")
	    if (result) {
       alert("장바구니에 삭제 되었습니다.")
       <%
       session_file_name.remove(index);
       session_price.remove(index);
       session_contents.remove(index);

	
		session.setAttribute("session_file_name", session_file_name);
       session.setAttribute("session_price", session_price);
       session.setAttribute("session_contents", session_contents);%>
       window.location.href=  "cart.jsp";
    } else {
    alert("장바구니 삭제를 취소하였습니다.")
    window.location.href = "cart.jsp";
    }

</script>
	<%
}else{%>
<script type="text/javascript">
alert("장바구니 삭제 실패")
window.location.href = "cart.jsp";
</script>
	<%	
}
%>