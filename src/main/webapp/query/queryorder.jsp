<%@ page import="ca.snappay.openapi.request.order.QueryOrderRequest" %>
<%@ page import="ca.snappay.openapi.response.order.QueryOrderResponse" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="com.google.gson.JsonArray" %>
<%@ page import="ca.snappay.openapi.response.order.QueryOrderResponseData" %>
<%@ page import="com.google.gson.stream.JsonWriter" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="../include/client.jsp"%>

<%
	QueryOrderRequest apiRequest = new QueryOrderRequest();
	apiRequest.setOrderNo(request.getParameter("out_order_no"));

	QueryOrderResponse apiResponse = client.execute(apiRequest);

	if ("get".equalsIgnoreCase(request.getMethod())) {
		JsonObject json = new JsonObject();
		json.addProperty("code", apiResponse.getCode());
		JsonArray data = new JsonArray();
		for (QueryOrderResponseData item : apiResponse.getData()) {
			JsonObject d = new JsonObject();
			d.addProperty("trans_status", item.getTransactionStatus().name());
			data.add(d);
		}
		json.add("data", data);
		Gson gson = new Gson();
		out.println(gson.toJson(json));
	} else {
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Snappay mobile payment demo</title>
</head>

<body>
<%
		out.println(apiResponse.toString());
%>
</body>
</html>
<%
	}
%>