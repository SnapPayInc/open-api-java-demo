<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Return Url Page</title>
</head>
<body>
<%
    if (request.getParameter("out_order_no") != null) {
        out.println("out_order_no: " + request.getParameter("out_order_no") + "<br>");
    }
    out.println("Pay Succeed!");

    /*
     * do business logic here, such as thank you customer.
     */
%>
</body>
</html>
