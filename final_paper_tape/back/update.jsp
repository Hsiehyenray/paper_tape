<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%
			if(session.getAttribute("id") != null ){
				if(request.getParameter("account")!=null){
				sql = "UPDATE `member` SET `password`='"+request.getParameter("password")+"' WHERE `account`='"+session.getAttribute("id")+"'";
				con.createStatement().execute(sql);	
				sql = "UPDATE `member` SET `name`='"+request.getParameter("name")+"' WHERE `account`='"+session.getAttribute("id")+"'";
				con.createStatement().execute(sql);	
				sql = "UPDATE `member` SET `email`='"+request.getParameter("email")+"' WHERE `account`='"+session.getAttribute("id")+"'";
				con.createStatement().execute(sql);
				sql = "UPDATE `member` SET `account`='"+request.getParameter("account")+"' WHERE `account`='"+session.getAttribute("id")+"'";
				con.createStatement().execute(sql);
				
				con.close();//結束資料庫連結
				out.print("更新成功!! 請<a href='member.jsp'>按此</a>回會員頁面!!");
				}
				else{
				con.close();//結束資料庫連結	
				out.print("更新失敗!! 請填寫完整，<a href='member.jsp'>按此</a>回會員頁面!!");
				}
			}
			else{
				con.close();//結束資料庫連結
			}

%>	
