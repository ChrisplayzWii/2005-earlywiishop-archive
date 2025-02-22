<%@ include file="Common.jspf" %>

<!-- Links -->
<c:url var="buyWithCreditCardUrl" value="BuyPoints.jsp">
	<c:param name="pay" value="CC"/>
</c:url>	

<c:url var="buyWithPrepaidCardUrl" value="PrepaidCardInput.jsp">
	<c:param name="next" value="BuyPointsResult.jsp"/>
</c:url>	

<!-- Main page -->
<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>Add Points</title>
</head>

<body>
<CENTER>
<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
		<button class="tdButton" onclick="showHome()"><fmt:message key="all.home"/></button>
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('AddPoints')"><fmt:message key="all.help"/></button>
	</TD>		
</TR>
</TABLE>

<H1>Add points</H1>
<UL>
<A HREF="<c:out value="${buyWithCreditCardUrl}"/>">Buy points with a Credit Card</A>
</UL>
<UL>
<A HREF="<c:out value="${buyWithPrepaidCardUrl}"/>">Buy points with a Prepaid Card</A>
</UL>

<button class="tdbutton" onclick="showBack()"><fmt:message key="all.back"/></button>

</CENTER>

</body>
</html>