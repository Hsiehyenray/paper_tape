<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>email</title>
  </head>
<body>
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
		       String new_email=new String(request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8");
		 
           
//Step 4: 執行 SQL 指令	
           sql="INSERT `subscibe` (`email`) ";
           sql+="VALUE ('" + new_email + "', ";)"; 
           con.createStatement().execute(sql);		   
//Step 5: 顯示結果 
		  out.println("<script type='text/javascript'>");
			out.println("alert('訂閱成功!最新消息會發email讓您第一手得到~');location.href='../QA.jsp'; ");
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