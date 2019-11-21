<%@ page import="com.google.gson.JsonParser" %>
<%@ page import="ca.snappay.openapi.sign.SignHandler" %>
<%@ page import="com.google.gson.JsonObject" %>

<%@include file="../include/client.jsp"%>

<%
    JsonObject body = (JsonObject) JsonParser.parseReader(request.getReader());

    if (SignHandler.verifySign(client.getConfig(), body)) {
        
        //do business logic here, such as notify business system the transaction has finished.
        
        if ("SUCCESS".equals(body.get("trans_status").getAsString())) {
            // must only show 'SUCCESS', so that SNAPPAY server will no longer re-send notification
            JsonObject reply = new JsonObject();
            reply.addProperty("code", "0");
            reply.addProperty("msg", "SUCCESS");
            String replyBody = SignHandler.sign(client.getConfig(), reply);

            out.print(replyBody);
        }
    } else {
        out.print("illegal sign");
    }
%>
