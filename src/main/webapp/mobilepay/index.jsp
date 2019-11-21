<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<%@include file="../include/header.jsp"%>
<body text=#000000 bgColor="#ffffff" leftMargin=0 topMargin=4>
<div id="main">

	<div class="cashier-nav">
		<ol>
			<li>[ Mobile H5 Payment Java Demo (Open this page with Alipay) ]  </li>
			<li class="current"> Create Order</li>
		</ol>
	</div>

	<form id="pay_form" action="payapi.jsp" method="post" >
		<div id="body" style="clear: left">
			<dl class="content">
				<dt>trans_amount: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30" name="trans_amount" value="0.01"/>
					<span> </span>
				</dd>
				<dt>payment_method: </dt>
				<dd>
					<span class="null-star">*</span>
					<input size="30" name="payment_method" value="ALIPAY" readonly="true"/>
					<span> payment_method</span>
				</dd>

				<dt>out_order_no: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30" name="out_order_no"
															value="<%=orderId%>"/> <span> out_order_no</span>
				</dd>
				<dt>timestamp: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30"
															name="timestamp" value="<%=dateTimeStr%>"/> <span> timestamp (UTC)</span>
				</dd>
				<dt>notify_url: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30"
															name="notify_url" value="http://<%=serverPath%>/notifyurl.jsp" /> <span> notify_url</span>
				</dd>
				<dt>description: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30"
															name="description" value="mobile-shopping-javatest" /> <span> description</span>
				</dd>
				<dt>merchant_no: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30" name="merchant_no" value="901800000116" /> <span> merchant_no </span>
				</dd>

				<br/>
				<dd>
						<div class="wrapper buy-wrapper">
                <a href="javascript:void(0);" class="J-btn-submit btn mj-submit btn-strong btn-larger btn-block">GotoPay</a>
            </div>
				</dd>
			</dl>
		</div>
	</form>
   <br><br>
	<div id="foot">
		<a href="../demo.zip">Download Java Demo files</a>
	</div>
</div>

<script type="text/javascript" src="ap.js"></script>
<script>
		var btn = document.querySelector(".J-btn-submit");
		btn.addEventListener("click", function (e) {
				e.preventDefault();
				e.stopPropagation();
				e.stopImmediatePropagation();
				var queryParam = '';
				Array.prototype.slice.call(document.querySelectorAll("input")).forEach(function (ele) {
						queryParam += '&' + ele.name + "=" + encodeURIComponent(ele.value);
				});
				var gotoUrl = document.querySelector("#pay_form").getAttribute('action') + '?' + queryParam;
				_AP.pay(gotoUrl);

				return false;
		}, false);
</script>

</body>
</html>
