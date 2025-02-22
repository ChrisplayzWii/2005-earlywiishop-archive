<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>Buy Points</title>
</head>

<jsp:useBean id="pricings" class="com.broadon.cas.PointListBean"  scope="request">
</jsp:useBean>

<c:choose>
	<c:when test="${param.pay == 'CC'}">
    	<c:set var="paymentPage" value="CreditCardInput.jsp" />
    </c:when>
	<c:when test="${param.pay == 'PC'}">
    	<c:set var="paymentPage" value="PrepaidCardInput.jsp" />
    </c:when>
	<c:otherwise>
    	<c:set var="paymentPage" value="PrepaidCardInput.jsp" />
   </c:otherwise>
</c:choose>

<body>
<CENTER>

<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
		<button class="tdButton" onclick="showHome()"><fmt:message key="all.home"/></button>
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('BuyPoints')"><fmt:message key="all.help"/></button>
	</TD>		
</TR>
</TABLE>

<BR>
<fmt:message key="buyPoints.showCurrentPoints">
<fmt:param>
	<SCRIPT language="JavaScript">
	document.write(EC_getPoints());
	</SCRIPT>
</fmt:param>
</fmt:message>

<BR><BR>
<fmt:message key="buyPoints.choosePoints" />

<TABLE cellpadding="5">
<c:forEach var="pricing" items="${pricings.points}">
	<tr><td>		
		<c:url value="${paymentPage}" var="paymentUrl">
			<c:param name="item" value="${pricing.itemId}"/>
			<c:param name="price" value="${pricing.itemPrice}"/>
			<c:param name="currency" value="${pricing.itemCurrency}"/>
			<c:param name="points" value="${pricing.refillPoints}"/>
			<c:param name="next" value="BuyPointsResult.jsp"/>
		</c:url>

		<a href='<c:out value="${paymentUrl}"/>'>
		<fmt:message key="all.points">
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
</TABLE>
</CENTER>

</body>
</html>