<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<%@include file="../include/header.jsp"%>
<body text=#000000 bgColor="#ffffff" leftMargin=0 topMargin=4>
<div id="main">
	<div class="cashier-nav">
		<ol>
			<li>[ SnapPay Java Demo ]  </li>
			<li class="current">Cancel order</li>
		</ol>
	</div>

	<form action="cancelorder.jsp" method="post" >
		<div id="body" style="clear: left">
			<dl class="content">
				<dt>out_order_no: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30" name="out_order_no" /> <span> (origin order no)</span>
				</dd>
				<dt>sign_key: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30" name="sign_key" value="7e2083699dd510575faa1c72f9e35d43" /> <span> sign_key (MUST keep sign key secretly)</span>
				</dd>
				<dt>merchant_no: </dt>
				<dd>
					<span class="null-star">*</span> <input size="30" name="merchant_no" value="901800000116" /> <span> merchant_no </span>
				</dd>

				<br/>
				<dd>
						<span class="new-btn-login-sp">
							<button class="new-btn-login" type="submit"
									style="text-align: center;">Cancel</button>
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
