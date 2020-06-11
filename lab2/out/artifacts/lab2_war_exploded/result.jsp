<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Result</title>
</head>
<body>
<% Double msg = (Double)request.getAttribute("result");
    out.println(String.format("V = %." + (Integer)request.getAttribute("t")+"f", msg));
%>
<br />
<a href="${pageContext.request.contextPath}/">Try again!!!</a>
</body>
</html>