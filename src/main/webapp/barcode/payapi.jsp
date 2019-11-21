<%@ page import="ca.snappay.openapi.request.pay.BarCodePayRequest" %>
<%@ page import="ca.snappay.openapi.constant.PaymentMethod" %>
<%@ page import="ca.snappay.openapi.response.pay.BarCodePayResponse" %>
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
	BarCodePayRequest apiRequest = new BarCodePayRequest();
	apiRequest.setPaymentMethod(PaymentMethod.valueOf(request.getParameter("payment_method")));
	apiRequest.setOrderNo(request.getParameter("out_order_no"));
	apiRequest.setAmount(Double.valueOf(request.getParameter("trans_amount")));
	apiRequest.setAuthCode(request.getParameter("auth_code"));
	apiRequest.setDescription(request.getParameter("description"));

	BarCodePayResponse apiResponse = client.execute(apiRequest);

	out.println(apiResponse.toString());
%>
</body>
</html>
