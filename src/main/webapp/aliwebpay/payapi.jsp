<%@ page import="ca.snappay.openapi.request.pay.BarCodePayRequest" %>
<%@ page import="ca.snappay.openapi.constant.PaymentMethod" %>
<%@ page import="ca.snappay.openapi.response.pay.BarCodePayResponse" %>
<%@ page import="ca.snappay.openapi.request.pay.WebsitePayRequest" %>
<%@ page import="ca.snappay.openapi.constant.BrowserType" %>
<%@ page import="ca.snappay.openapi.response.pay.WebsitePayResponse" %>
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
	WebsitePayRequest apiRequest = new WebsitePayRequest();
	apiRequest.setPaymentMethod(PaymentMethod.valueOf(request.getParameter("payment_method")));
	apiRequest.setOrderNo(request.getParameter("out_order_no"));
	apiRequest.setAmount(Double.valueOf(request.getParameter("trans_amount")));
	apiRequest.setNotifyUrl(request.getParameter("notify_url"));
	apiRequest.setReturnUrl(request.getParameter("return_url"));
	apiRequest.setDescription(request.getParameter("description"));
	apiRequest.setBrowserType(BrowserType.valueOf(request.getParameter("browser_type")));

	WebsitePayResponse apiResponse = client.execute(apiRequest);

	if ("0".equals(apiResponse.getCode())) {
		String payUrl = apiResponse.getData().get(0).getWebpayUrl();
		response.sendRedirect(payUrl);
	}
%>
</body>
</html>