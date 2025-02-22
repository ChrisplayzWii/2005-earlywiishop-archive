<%@ include file="Common.jspf" %>

<!-- Links -->
<c:url var="buyWithCreditCardUrl" value="BuyPoints.jsp">
	<c:param name="pay" value="CCARD"/>
</c:url>	

<c:url var="buyWithPrepaidCardUrl" value="PrepaidCardInput.jsp">
	<c:param name="next" value="BuyPointsResult.jsp"/>
</c:url>	

<!-- Main page -->
<html>
<head>
  <%@ include file="Header.jspf" %>
  <title><fmt:message key="addPoints.title" /></title>
</head>

<body>
<CENTER>
<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
		<button class="tdButton" onclick="showHome()"><fmt:message key="button.home"/></button>
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('AddPoints')"><fmt:message key="button.help"/></button>
	</TD>		
</TR>
</TABLE>

<H1><fmt:message key="addPoints.title" /></H1>
<UL>
<A HREF="<c:out value="${buyWithCreditCardUrl}"/>"><fmt:message key="addPoints.buyWithCreditCard" /></A>
</UL>
<UL>
<A HREF="<c:out value="${buyWithPrepaidCardUrl}"/>"><fmt:message key="addPoints.buyWithPrepaidCard" /></A>
</UL>

<button class="tdbutton" onclick="showBack()"><fmt:message key="button.back"/></button>

</CENTER>

</body>
</html>