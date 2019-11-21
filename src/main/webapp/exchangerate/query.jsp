<%@ page import="ca.snappay.openapi.constant.PaymentMethod" %>
<%@ page import="ca.snappay.openapi.request.misc.QueryExchangeRateRequest" %>
<%@ page import="ca.snappay.openapi.response.misc.QueryExchangeRateResponse" %>
<%@ page import="ca.snappay.openapi.constant.Currency" %>
<%@ page import="ca.snappay.openapi.constant.PaymentType" %>
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
	QueryExchangeRateRequest apiRequest = new QueryExchangeRateRequest();
	apiRequest.setPaymentMethod(PaymentMethod.valueOf(request.getParameter("payment_method")));
	apiRequest.setCurrency(Currency.valueOf(request.get("basic_currency_unit")));
	apiRequest.setPaymentType(PaymentType.valueOf(request.getParameter("pay_type")));

	QueryExchangeRateResponse apiResponse = client.execute(apiRequest);

	out.println(apiResponse.toString());
%>
</body>
</html>
