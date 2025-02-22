<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>Searching for Titles</title>
</head>

<body>

<CENTER>
<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
		<button class="tdButton" onclick="showHome()"><fmt:message key="all.home"/></button>
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('SearchTitle')"><fmt:message key="all.help"/></button>
	</TD>		
</TR>
</TABLE>

<TABLE>
<TR>
<TD></TD>
<TD>Please enter a title</TD>
<TR>
<TD>Title</TD>
<TD>
	<form action="ListTitles.jsp" method="post">
	<fmt:message var="heading" key="listTitles.searchResultsHeading"/>
	<input type="hidden" name="heading" value="<c:out value="${heading}"/>" />
	<input type="hidden" name="p" value="1"/>
	<input type="text" name="title"/>
	<input type="submit" name="Search" value="Search"/>
	</form>	
</TD>	
</TR>
</TABLE>

<BR><BR>
<button class="tdbutton" onclick="showBack()"><fmt:message key="all.back"/></button>

</CENTER>

</body>
</html>