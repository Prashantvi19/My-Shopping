<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
if("client".equals(request.getParameter("msg"))==false){
	response.sendRedirect("../client/singin.jsp");
}else{
	response.sendRedirect("../client/index.jsp");
}

%>