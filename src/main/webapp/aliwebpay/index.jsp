<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<%@include file="../include/header.jsp"%>
<body text=#000000 bgColor="#ffffff" leftMargin=0 topMargin=4>
<div id="main">

	<div class="cashier-nav">
		<ol>
			<li>[ Alipay Web Java Demo ]  </li>
			<li class="current"> Create Order</li>
		</ol>
	</div>

	<form  action="payapi.jsp"  method="post" >
		<div id="body" style="clear: left">
			<dl class="content">
				<dt> trans_amount: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30" name="trans_amount" value="0.01"/>
					<span> </span>
				</dd>
				<dt>payment_method: </dt>
				<dd>
					<span class="null-star">*</span>
					<select name="payment_method" id="payment_method">
						<option value="ALIPAY">ALIPAY</option>
						<option value="UNIONPAY">UNIONPAY</option>
					</select>
					<span> payment_method</span>
				</dd>
				<dt>browser_type: </dt>
				<dd>
					<span class="null-star">*</span>
					<select name="browser_type" id="browser_type">
						<option value="PC">PC</option>
						<option value="WAP">WAP</option>
					</select>
					<span> browser_type</span>
				</dd>

				<dt>out_order_no: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30" name="out_order_no"
															value="<%=orderId%>"/> <span> out_order_no</span>
				</dd>
				<dt>timestamp: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30"
															name="timestamp" value="<%=dateTimeStr%>"/> <span> timestamp</span>
				</dd>
				<dt>notify_url: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30"
															name="notify_url" value="http://<%=serverPath%>/notifyurl.jsp" /> <span> notify_url</span>
				</dd>
				<dt>return_url: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30" name="return_url" 
						value="http://<%=serverPath%>/returnurl.jsp?out_order_no=<%=orderId%>" /> <span> return_url</span>
				</dd>
				<dt>description: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30"
															name="description" value="mobile-shopping-phptest" /> <span> description</span>
				</dd>
				<dt>merchant_no: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30" name="merchant_no" value="901800000116" /> <span> merchant_no </span>
				</dd>
				<dt>signKey: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30" name="signKey" value="7e2083699dd510575faa1c72f9e35d43" /> <span> signKey </span>
				</dd>
				<dt>app_id: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30" name="app_id" value="9f00cd9a873c511e" /> <span> app_id </span>
				</dd>
				<dt>trans_currency: </dt>
				<dd>
					<span class="null-star">*</span> 
					<select name="trans_currency" id="trans_currency">
						<option value="CAD">CAD</option>
						<option value="USD">USD</option>
					</select> <span> trans_currency </span>
				</dd>

				<br/>
				<dd>
						<span class="new-btn-login-sp">
							<button class="new-btn-login" type="submit"
									style="text-align: center;">Create</button>
						</span>
				</dd>
			</dl>
		</div>
	</form>
   <br><br>
	<div id="foot">
		<a href="../demo.zip">Download Java Demo files</a>
	</div>
</div>

</body>
</html>
