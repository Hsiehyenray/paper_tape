<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <title>contact</title>
  </head>
<body>
<%  request.setCharacterEncoding("UTF-8")  ;%>
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use `store`";
           con.createStatement().execute(sql);
		       String new_name=request.getParameter("name");
		       String new_email=request.getParameter("email");
		       String new_subject=request.getParameter("subject");
           String new_comment=request.getParameter("comment");
           sql="INSERT `contact` (`name`,`email`, `subject`,`comment`) ";
           sql+="VALUE ('" + new_name + "', ";
           sql+="'"+new_email+"', ";
		   sql+="'"+new_subject+"', ";
		   sql+="'"+new_comment+"')"; 
           con.createStatement().execute(sql);		   
//Step 5: 顯示結果 
		  out.println("<script type='text/javascript'>");
			out.println("alert('成功收到!');location.href='../index.jsp'; ");
		  out.println("</script>");
       }
//step 6:關閉連線
   con.close();
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}

%>

</body>
</html>