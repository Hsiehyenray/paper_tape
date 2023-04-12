<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <title></title>
  </head>
  <body>
<%
if(request.getParameter("username") !=null && request.getParameter("password") != null){
    sql = "SELECT * FROM `member` WHERE `account`=? AND `password`=?";
    PreparedStatement pstmt = null;
	pstmt=con.prepareStatement(sql);
    pstmt.setString(1,request.getParameter("username"));
    pstmt.setString(2,request.getParameter("password"));
	ResultSet paperrs = pstmt.executeQuery();
	
    
    if(paperrs.next()){            
        session.setAttribute("id",request.getParameter("username"));
		con.close();//結束資料庫連結
        response.sendRedirect("../index.jsp") ;
    }
    else{
        con.close();//結束資料庫連結
		out.println("<script type='text/javascript'>");
			out.println("alert('請重新登入!');location.href='../index.jsp'; ");
		out.println("</script>");
	}
}
%>
  </body>
</html>