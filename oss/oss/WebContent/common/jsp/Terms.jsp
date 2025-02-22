<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>Terms of Usage</title>
</head>

<jsp:useBean id="eula" class="com.broadon.cas.MessagesBean" scope="request">
</jsp:useBean>

<SCRIPT language="JavaScript">
	// Check if device is registered
	function checkRegistered()
	{
    	var r = ec.getDeviceInfo ();
        if (r.vcId != 0) {
         	// Already registered (disable terms and buttons)
	 	    document.getElementById("Terms").disabled = "disabled";	
	 	    document.getElementById("AgreeButton").disabled = "disabled";	
	 	    document.getElementById("DisagreeButton").disabled = "disabled";	
		}				
	}
	
	function initPage()
	{
//		checkRegistered();
	}
</SCRIPT>

<body onload="initPage()">
<CENTER>
Terms
<BR><BR>
<textarea name="Terms" rows=20 cols="80" id="Terms" readonly>
<c:forEach var="message" items="${eula.messages}">
<c:out value="${message}"/>   
</c:forEach>
</textarea>
<BR><BR>

<button id="DisagreeButton" class="tdButton" onclick="showBack()">I do not agree</button>
<button id="AgreeButton" class="tdButton" onclick="registerVirtualConsole()"  >I agree</button>
<%@ include file="Progress.jspf" %>
<br>
<button class="tdbutton" onclick="showBack()"><fmt:message key="button.back"/></button>

</CENTER>

</body>
</html>