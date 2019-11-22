<%@ page import="ca.snappay.openapi.request.pay.BarCodePayRequest" %>
<%@ page import="ca.snappay.openapi.constant.PaymentMethod" %>
<%@ page import="ca.snappay.openapi.response.pay.BarCodePayResponse" %>
<%@ page import="ca.snappay.openapi.request.order.RevokeOrderRequest" %>
<%@ page import="ca.snappay.openapi.response.order.RevokeOrderResponse" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="../include/client.jsp"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Snappay mobile payment demo</title>
</head>

<body>
<%
	RevokeOrderRequest apiRequest = new RevokeOrderRequest();
	apiRequest.setOrderNo(request.getParameter("out_order_no"));

	RevokeOrderResponse apiResponse = client.execute(apiRequest);

	out.println(apiResponse.toString());
%>
</body>
</html>
