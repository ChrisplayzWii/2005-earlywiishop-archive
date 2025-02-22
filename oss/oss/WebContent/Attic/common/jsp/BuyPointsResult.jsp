<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>Confirm point balance</title>
</head>

<SCRIPT language="JavaScript">
<c:choose>
	<c:when test="${param.pay == 'CC'}">
		function getPayment()
		{
        	// Credit card info
            var ccKind      = '<c:out value="${param.cckind}"/>'
            var ccNumber    = '<c:out value="${param.ccnumber}"/>'
            var cvv2        = '<c:out value="${param.cvv2}"/>'
            var expMonth    = '<c:out value="${param.expmonth}"/>'
            var expYear     = '<c:out value="${param.expyear}"/>'
            var ccOwner     = '<c:out value="${param.ccowner}"/>'
            var addr        = '<c:out value="${param.addr}"/>'            
            return new EC_CreditCardPayment(ccKind, ccNumber, ccOwner, expMonth, expYear, cvv2, addr);            
    	}
    </c:when>
	<c:when test="${param.pay == 'PC'}">
		function getPayment()
		{
			var ecardNumber = '<c:out value="${param.cnumber}"/>'
			return new EC_ECardPayment(ecardNumber);
		}
    </c:when>
	<c:otherwise>
		function getPayment()
		{
			return null;
		}
   </c:otherwise>
</c:choose>

	function getPrice()
	{
		var amount      = '<c:out value="${param.price}"/>'
		var currency    = '<c:out value="${param.currency}"/>'
        return new EC_Price (amount, currency);
	}
	
	function getRefillPoints()
	{
		return '<c:out value="${param.points}"/>';
	}

	function showPayment(payment)
	{
		if (payment != null) {
			if (payment.paymentMethod == EC_PaymentMethodType_ECard) {
				document.getElementById("PaymentInfo").innerHTML = "Prepaid Card: " + payment.eCard;
			} else if (payment.paymentMethod == EC_PaymentMethodType_CreditCard) {
				document.getElementById("PaymentInfo").innerHTML = 
					"Credit Card Type: " + EC_CreditCardKinds[payment.ccKind] + "<BR>" +
					"Credit Card Number: " + payment.ccNumber + "<BR>" +
					"CVV2: " + payment.cvv2 + "<BR>" +
					"Expiration Date: " + payment.expMonth + " Month, " + payment.expYear + " Year" + "<BR>" +
					"Owner: " + payment.ccOwner + "<BR>" +
					"Address: " + payment.addr;
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
            var itemId = '<c:out value="${param.item}"/>'
            var purchaseReq = new EC_PurchaseRequest (itemId, price, payment);

            // Set points to buy in purcahsedPoints.value
            // Total account points balance will be returned in purchasedPoints.value

            purchasedPoints.value = pointsToBuy;
			document.getElementById("ConfirmButton").disabled = "disabled";
            var opId = ec.purchasePoints (purchasedPoints, purchaseReq);

			var answer = pointsToBuy + " points";

            if (opId < 0) {
                setErr ( "ERROR: purchasePoints  " + answer +
                             "  returned: " + errString(opId));
            }
            else {
                activeOpId = opId;
                buyPointsName = "Buy Points";
                buyPointsDesc = "Buying Points:  " + answer;
                showProgress(true, buyPointsName, buyPointsDesc, "onBuyPointsDone");
            }
        }

        function onBuyPointsDone(rv, progress)
        {
            showResult (rv, buyPointsName, buyPointsDesc);
            onOpDone ();
            if (rv >= 0) {
                //setPoints(purchasedPoints.value);
				document.getElementById("Success").style.display = '';
				document.getElementById("PurchaseDetails").style.display = 'none';
            } else {
            	setErr("ERROR");
            }
			document.getElementById("Confirm").style.display = 'none';
			document.getElementById("Done").style.display = '';
        }
        
        function initPage()
        {
	        var refillPoints = '<c:out value="${param.points}" />';
			<!-- TODO: prepay step - EC call to check points, payment, tax -->
			document.getElementById("Success").style.display = 'none';
			document.getElementById("Confirm").style.display = '';
			document.getElementById("Done").style.display = 'none';
			document.getElementById("balance1").innerHTML = EC_getPoints();
			document.getElementById("balance2").innerHTML = EC_getPoints() + refillPoints;
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
		<button class="tdButton" onclick="showHelp('ConfirmPoints')"><fmt:message key="all.help"/></button>
	</TD>		
</TR>
</TABLE>

<BR><BR>
<div id="PurchaseDetails">
	<c:catch var="error">
		<fmt:formatNumber var="price" type="currency" value="${param.price}" currencyCode="${param.currency}"/>
	</c:catch>
	<c:if test="${not empty error}">
		<c:set var="price" value="${param.price} ${param.currency}"/>
	</c:if>

	<fmt:message key="buyPointsResult.addingPoints">
		<fmt:param value="${param.points}" />
		<fmt:param value="${price}" />
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
<fmt:param value="${param.points}" />
</fmt:message>
<BR>
<fmt:message key="buyPointsResult.showCurrentPoints">
<fmt:param>
	<SCRIPT language="JavaScript">
	document.write(EC_getPoints() + <c:out value="${param.points}" />);
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