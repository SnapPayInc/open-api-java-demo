<%@ page import="ca.snappay.openapi.request.order.RefundOrderRequest" %>
<%@ page import="ca.snappay.openapi.response.order.RefundOrderResponse" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="../include/client.jsp"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Snappay refund demo</title>
</head>

<body>
<%
	RefundOrderRequest apiRequest = new RefundOrderRequest();
	apiRequest.setOrderNo(request.getParameter("out_order_no"));
	apiRequest.setRefundOrderNo(request.getParameter("out_refund_no"));
	apiRequest.setRefundAmount(Double.valueOf(request.getParameter("refund_amount")));

	RefundOrderResponse apiResponse = client.execute(apiRequest);

	out.println(apiResponse.toString());
%>
</body>
</html>
