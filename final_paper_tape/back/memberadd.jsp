<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <title>add</title>
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
		   String new_account=request.getParameter("account");
		   String new_pwd=request.getParameter("password");
		   String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
		   String new_email=request.getParameter("email");
//Step 4: 執行 SQL 指令	

		   sql = "SELECT * FROM `member` WHERE (`account`='"+new_account+"')";
		   ResultSet rs =  con.createStatement().executeQuery(sql);  
		   if(rs.next()){
			   out.println("<script type='text/javascript'>");
					out.println("alert('帳號重複!請重新註冊!');location.href='../index.jsp'; ");
			   out.println("</script>");
		   }else{
           sql="INSERT `member` (`account`,`password`, `name`,`email`) ";
           sql+="VALUE ('" + new_account + "', ";
           sql+="'"+new_pwd+"', ";
		       sql+="'"+new_name+"', ";
		       sql+="'"+new_email+"')"; 
           con.createStatement().execute(sql);
		   }
//Step 6: 關閉連線
           con.close();
		   
//Step 5: 顯示結果 
          //直接顯示最新的資料
		  out.println("<script type='text/javascript'>");
			out.println("alert('註冊成功!');location.href='../index.jsp'; ");
		  out.println("</script>");
       }
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