<%@ include file="Common.jspf" %>

<jsp:useBean id="taxResult" class="com.broadon.oss.CreditCardBean" scope="request">
</jsp:useBean>

<jsp:useBean id="pointPricings" class="com.broadon.cas.ECardPointListBean" scope="request">
</jsp:useBean>

<jsp:useBean id="pointPricing" class="com.broadon.cas.Point" scope="request">
</jsp:useBean>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>Confirm point balance</title>
</head>

<SCRIPT language="JavaScript">
<c:choose>
	<c:when test="${param.pay == 'CCARD'}">
		function getPayment()
		{
        	// Credit card info
            var cc = new ECCreditCardPayment();
            cc.number = '<c:out value="${param.cc_number}"/>';
            return cc;
    	}
    </c:when>
	<c:when test="${param.pay == 'ECARD'}">
		function getPayment()
		{
			var ecardNumber = '<c:out value="${param.cnumber}"/>'
			return new ECECardPayment(ecardNumber);
		}
    </c:when>
	<c:otherwise>
		function getPayment()
		{
			return new ECAccountPayment ();;
		}
   </c:otherwise>
</c:choose>

	function getPrice()
	{
		var amount      = '<c:out value="${pointPricing.itemPrice}"/>'
		var currency    = '<c:out value="${pointPricing.itemCurrency}"/>'
        return new ECPrice (amount, currency);
	}
	
	function getRefillPoints()
	{
		return '<c:out value="${pointPricing.refillPoints}"/>';
	}

	function showPayment(payment)
	{
		if (payment != null) {
			if (payment.paymentMethod == EC_PaymentMethod_ECard) {
				document.getElementById("PaymentInfo").innerHTML = "Prepaid Card: " + payment.number;
			} else if (payment.paymentMethod == EC_PaymentMethod_CreditCard) {
				document.getElementById("PaymentInfo").innerHTML = 
					"Credit Card Number: " + payment.number;
			}
		}
	}

	    function buyPoints(payment)
        {
			// Points to buy             
			var pointsToBuy = getRefillPoints();
			
            // Price
            var price = getPrice();
            
            // Request
            var itemId = '<c:out value="${pointPricing.itemId}"/>';
			var payment = getPayment();
	        var taxes = null;
	        var discount = null;
	        var purchaseInfo = null;
<c:if test="${not empty taxResult && not empty taxResult.retTxn}">
	<c:if test="${taxResult.retTxn.result == 'SUCCESS'}">
			taxes = '<c:out value="${taxResult.retTxn.totalTax}"/>'; 
			purchaseInfo = '<c:out value="${taxResult.retTxnString}" escapeXml="false" />';
	</c:if>
</c:if>
		
			document.getElementById("ConfirmButton").disabled = true;
            var progress = ec.purchasePoints (pointsToBuy, itemId, price, payment, taxes, purchaseInfo, discount);

            opName = "Purchase Points";
            opDesc = "Purchasing " + pointsToBuy + " Points ";
	        if ( wasOpStarted (progress, opDesc)) {
                showProgress(true, opName, opDesc, "onBuyPointsDone");
            } else {
            	onBuyPointsDone(progress);
            }
        }

        function onBuyPointsDone(progress)
        {
			showResult (progress, opName, opDesc);
			finishOnOpDone ();    
            if (progress.status >= 0) {
				document.getElementById("Success").style.display = '';
            } 
  		    document.getElementById("PurchaseDetails").style.display = 'none';
			document.getElementById("Confirm").style.display = 'none';
			document.getElementById("Done").style.display = '';
        }
        
        function initPage()
        {
		 	vcInitPage();
	        var refillPoints = parseInt('<c:out value="${pointPricing.refillPoints}" />');
			<!-- TODO: prepay step - EC call to check points, payment, tax -->
			document.getElementById("Success").style.display = 'none';
			document.getElementById("Confirm").style.display = '';
			document.getElementById("Done").style.display = 'none';
			document.getElementById("balance1").innerHTML = vcGetBalance();
			document.getElementById("balance2").innerHTML = vcGetBalance() + refillPoints;
			var payment = getPayment();
			showPayment(payment);
        }
</SCRIPT>

<body onload="initPage()">
<CENTER>

<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('ConfirmPoints')"><fmt:message key="button.help"/></button>
	</TD>		
</TR>
</TABLE>

<BR><BR>
<div id="PurchaseDetails">

<c:if test="${not empty taxResult && not empty taxResult.retTxn}">
	<c:choose>
		<c:when test="${taxResult.retTxn.result == 'SUCCESS'}">
			<fmt:formatNumber var="totalAmount" type="currency" value="${taxResult.retTxn.totalAmount}" currencyCode="${taxResult.retTxn.currency}"/>
			<fmt:formatNumber var="totalTax" type="currency" value="${taxResult.retTxn.totalTax}" currencyCode="${taxResult.retTxn.currency}"/>
			<fmt:formatNumber var="totalPaid" type="currency" value="${taxResult.retTxn.totalPaid}" currencyCode="${taxResult.retTxn.currency}"/>
			<c:out value="Price: ${totalAmount}" /> <BR>
			<c:out value="Tax: ${totalTax}" /> <BR>
			<c:out value="Total: ${totalPaid}" /> <BR>
		</c:when>
		<c:otherwise>
			<c:catch var="error">
				<fmt:formatNumber var="totalPaid" type="currency" value="${pointPricing.itemPrice}" currencyCode="${pointPricing.itemCurrency}"/>
			</c:catch>
			<c:if test="${not empty error}">
				<c:set var="totalPaid" value="${pointPricing.itemPrice} ${pointPricing.itemCurrency}"/>
			</c:if>
		</c:otherwise>	
	</c:choose>		
</c:if>

	<BR><BR>
	<fmt:message key="buyPointsResult.addingPoints">
		<fmt:param value="${pointPricing.refillPoints}" />
		<fmt:param value="${totalPaid}" />
	</fmt:message>
	
	<BR>
	Current balance: <span id="balance1"></span>
	<BR>
	New balance (after purchase): <span id="balance2"></span>
	<BR><BR>

	<div id="PaymentInfo">
	</div>
</div>


<div id="Success">
<fmt:message key="buyPointsResult.addedPoints">
<fmt:param value="${pointPricing.refillPoints}" />
</fmt:message>
<BR>
<fmt:message key="buyPointsResult.showCurrentPoints">
<fmt:param>
	<SCRIPT language="JavaScript">
	document.write(vcGetBalance() + <c:out value="${pointPricing.refillPoints}" />);
	</SCRIPT>
</fmt:param>
</fmt:message>
</div>

<%@ include file="Progress.jspf" %>
<br>
<div id="Confirm">
<button class="tdbutton" onclick="buyPoints()" id="ConfirmButton"><fmt:message key="buyPointsResult.confirm"/></button>
</div>
<div id="Done">
<button class="tdbutton" onclick="showHome()"><fmt:message key="buyPointsResult.done"/></button>
</div>

</CENTER>

</body>
</html>