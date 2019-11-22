<%@ page import="ca.snappay.openapi.constant.PaymentMethod" %>
<%@ page import="ca.snappay.openapi.request.pay.H5PayRequest" %>
<%@ page import="ca.snappay.openapi.response.pay.H5PayResponse" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="../include/client.jsp"%>

<%
	H5PayRequest apiRequest = new H5PayRequest();
	apiRequest.setPaymentMethod(PaymentMethod.valueOf(request.getParameter("payment_method")));
	apiRequest.setOrderNo(request.getParameter("out_order_no"));
	apiRequest.setAmount(Double.valueOf(request.getParameter("trans_amount")));
	apiRequest.setNotifyUrl(request.getParameter("notify_url"));
	apiRequest.setReturnUrl(request.getParameter("return_url"));
	apiRequest.setDescription(request.getParameter("description"));

	H5PayResponse apiResponse = client.execute(apiRequest);

	if ("0".equals(apiResponse.getCode())) {
		String payUrl = apiResponse.getData().get(0).getH5PaymentUrl();
		response.sendRedirect(payUrl);
	}
%>
