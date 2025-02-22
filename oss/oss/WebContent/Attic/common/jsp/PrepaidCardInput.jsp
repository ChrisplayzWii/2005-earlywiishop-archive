<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>Prepaid Card Code Input</title>
</head>
<body>

<SCRIPT language="JavaScript">
	function validate()
	{
		// Check prepaid cardnumber is 16-digit
		var ok = true;
		var cardField = document.getElementById("cardNumber");
		if (cardField != null) {
			var cardNum = cardField.value;
			if (isNaN(cardNum) || cardNum.length != 16) {
				alert("Prepaid number need to be a 16 digit number");
				ok = false;			
			}
		}
		return ok;
	}
</SCRIPT>

<CENTER>

<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
		<button class="tdButton" onclick="showHome()"><fmt:message key="all.home"/></button>
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('PrepaidCard')"><fmt:message key="all.help"/></button>
	</TD>		
</TR>
</TABLE>

Enter the 16-digit number written on your prepaid card
<BR>
Prepaid Card Number
<BR>
<FORM action="<c:out value="${param.next}" />" onsubmit="return validate()" method="post">
<input type="hidden" name="pay" value="<c:out value="PC"/>" >
<input type="hidden" name="item" value="<c:out value="${param.item}" default="122"/>" >
<input type="hidden" name="points" value="<c:out value="${param.points}" default="1000"/>" >
<input type="hidden" name="price" value="<c:out value="${param.price}" default="10"/>" >
<input type="hidden" name="currency" value="<c:out value="${param.currency}" default="USD"/>" >
<input type="text" name="cnumber" id="cardNumber"/>
<BR><BR>
<button type="button" onclick="showHome()" id="ReturnButton"><fmt:message key="all.back"/></button>
<input type="submit" name="OK" value="OK" />
</FORM>
</CENTER>
</body>
</html>