<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title><fmt:message key="buyPoints.title" /></title>
<script type="text/JavaScript">
<!--
function initPage()
{
 	vcInitPage();
	var currentBalance = vcGetBalance();
	document.getElementById("CurrentBalance").innerHTML = currentBalance;
}
//-->
</script>
</head>

<jsp:useBean id="pointPricings" class="com.broadon.cas.PointListBean"  scope="request">
</jsp:useBean>

<% pageContext.setAttribute("pricingCount", new Integer(pointPricings.getPoints().size())); %>

<c:choose>
	<c:when test="${param.pay == 'CCARD'}">
    	<c:set var="paymentPage" value="CreditCardInput.jsp" />
    </c:when>
	<c:when test="${param.pay == 'ECARD'}">
    	<c:set var="paymentPage" value="PrepaidCardInput.jsp" />
    </c:when>
	<c:otherwise>
    	<c:set var="paymentPage" value="PrepaidCardInput.jsp" />
   </c:otherwise>
</c:choose>

<body onload="initPage()">
<CENTER>

<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
		<button class="tdButton" onclick="showHome()"><fmt:message key="button.home"/></button>
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('BuyPoints')"><fmt:message key="button.help"/></button>
	</TD>		
</TR>
</TABLE>

<BR>
<fmt:message key="buyPoints.showCurrentPoints">
<fmt:param>
	<span id="CurrentBalance"></span>
</fmt:param>
</fmt:message>

<BR><BR>

<c:catch var="error">
<c:choose>
<c:when test="${pricingCount eq '0'}">
</c:when>
<c:otherwise>
<fmt:message key="buyPoints.choosePoints" />
<TABLE cellpadding="5">
<c:forEach var="pricing" items="${pointPricings.points}">
	<tr><td>		
		<c:url value="${paymentPage}" var="paymentUrl">
			<c:param name="itemId" value="${pricing.itemId}"/>
			<c:param name="price" value="${pricing.itemPrice}"/>
			<c:param name="currency" value="${pricing.itemCurrency}"/>
			<c:param name="points" value="${pricing.refillPoints}"/>
			<c:param name="next" value="BuyPointsResult.jsp"/>
		</c:url>

		<a href='<c:out value="${paymentUrl}"/>'>
		<fmt:message key="all.npoints">
			<fmt:param value="${pricing.refillPoints}" />
		</fmt:message>
		<c:catch var="error">
			<fmt:formatNumber type="currency" value="${pricing.itemPrice}" currencyCode="${pricing.itemCurrency}" />
		</c:catch>
		<c:if test="${not empty error}">
			<c:out value="${pricing.itemPrice} ${pricing.itemCurrency}"/>
		</c:if>
		</a>
	</td></tr>
</c:forEach>
</c:otherwise>
</c:choose>
</c:catch>
<c:if test="${not empty error}">
	<c:out value="${error}"/>
</c:if>
</TABLE>
</CENTER>

</body>
</html>