<%@ include file="Common.jspf" %>

<jsp:useBean id="error" class="com.broadon.oss.ErrorBean"  scope="request">
</jsp:useBean>

<!-- Main page -->
<html>
<head>
  <%@ include file="Header.jspf" %>
  <title></title>
</head>

<body>
<CENTER>
<c:out value="${error.message}" />
<BR><BR>
<button class="tdbutton" onclick="showBack()"><fmt:message key="button.back"/></button>

</CENTER>

</body>
</html>