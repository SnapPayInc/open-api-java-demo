<%@ page import="ca.snappay.openapi.constant.PaymentMethod" %>
<%@ page import="ca.snappay.openapi.request.pay.QRCodePayRequest" %>
<%@ page import="ca.snappay.openapi.response.pay.QRCodePayResponse" %>
<%@ page import="ca.snappay.openapi.constant.Currency" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="../include/client.jsp"%>

<%
	QRCodePayRequest apiRequest = new QRCodePayRequest();
	apiRequest.setPaymentMethod(PaymentMethod.valueOf(request.getParameter("payment_method")));
	apiRequest.setOrderNo(request.getParameter("out_order_no"));
	apiRequest.setCurrency(Currency.valueOf(request.getParameter("trans_currency")));
	apiRequest.setAmount(Double.valueOf(request.getParameter("trans_amount")));
	apiRequest.setNotifyUrl(request.getParameter("notify_url"));
	apiRequest.setDescription(request.getParameter("description"));

	QRCodePayResponse apiResponse = client.execute(apiRequest);
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Snappay mobile payment demo</title>
</head>
<body>
<%
	if (!"0".equals(apiResponse.getCode())) {
		out.println("Create order fail. [" + apiResponse.getMessage() + "]");
	} else {
%>

	<h>Please scan QR code with <%="ALIPAY".equals(request.getParameter("payment_method")) ? "AliPay" : "WeChat"%></h>
	<br><br>
	<div id="code"></div> 
	<script type="text/javascript" src="lib/jquery-3.3.1.min.js"></script> 
	<script type="text/javascript" src="lib/jquery.qrcode.min.js"></script> 
	<script type="text/javascript">
		$("#code").qrcode({ 
		    width: 200,
		    height:200,
		    text: "<%=apiResponse.getData().get(0).getQrCodeUrl()%>"
		}); 
	</script> 

	<p>Transaction status: <span class="status"></span></p>

	<script>
        (function() {
            var out_order_no = "<%=apiRequest.getOrderNo()%>";
            var merchant_no = "<%=client.getConfig().getMerchantNo()%>";
            var counter = 0;
            var pollingurl = "../query/queryorder.jsp?out_order_no="+out_order_no+"&merchant_no="+merchant_no;
            var status = $('.status'),
                poll = function() {
                    status.text('Waiting ...');
                    console.log("waiting counter: " + counter);
                    if (counter++ >  30) { // timeout after 30 times
                        status.text(" TIMEOUT !!!  "); // timeout
                        clearInterval(pollInterval); // optional: stop poll function
                        console.log("waiting for user confirm transaction is timeout  " + " === ");
                    } else {
                        $.ajax({
                            url: pollingurl,
                            dataType: 'json',
                            type: 'get',
                            success: function(data) { 
								// check if it is available
								console.log("data.data[0].trans_status: " + data.data[0].trans_status);
                                if ( data.data[0].trans_status == 'SUCCESS' ) { // get and check data value
                                    status.text(data.data[0].trans_status); // get and print data string
                                    clearInterval(pollInterval); // optional: stop poll function
                                    console.log("queryorder.jsp return success " + " === ");
                                    window.location.replace("<%=request.getParameter("return_url") + "?out_order_no=" + apiRequest.getOrderNo()%>");
                                } else {
                                    status.text(data.data[0].trans_status);
                                    console.log("queryorder.jsp return not success   " + " === ");
                                }
                            },
                            error: function(xhr, status, error) { // error logging
                            	console.log(xhr);
                                var err = eval("(" + xhr.responseText + ")");
                                console.log(err.Message);
                            }
                        });
                    }

                };

            poll(); // also run function on init
            pollInterval = setInterval(function() { // run function every 5000 ms
                poll();
            }, 5000);
        })();
    </script>

<%
	}
%>
	
</body>
</html>
