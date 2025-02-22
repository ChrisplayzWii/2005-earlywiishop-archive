<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>Message from Nintendo</title>
</head>

<body>
<H1><center>Message from Nintendo</center></H1>
<center>
<H3>New</H3>
<textarea name="NewInformation" rows=7 cols="80" readonly>
<c:import url="${txtPath}/new.txt" charEncoding="UTF-8"/>   
</textarea>
<BR><BR>
<H3>History</H3>
<textarea name="History" rows=7 cols="80" readonly>
<c:import url="${txtPath}/history.txt" charEncoding="UTF-8"/>   
</textarea>
<BR><BR>
<button class="tdbutton" onclick="showBack()"><fmt:message key="button.back"/></button>
</center>

</body>
</html>