<%@ include file="Common.jspf" %>

<!-- Links -->
<c:url var="listAllUrl" value="ListTitles.jsp">
	<fmt:message var="heading" key="listTitles.allTitlesHeading" />
	<c:param name="p" value="1"/>
	<c:param name="heading" value="${heading}"/>
</c:url>	

<c:url var="listNewUrl" value="ListTitles.jsp">
	<fmt:message var="heading" key="listTitles.newTitlesHeading" />
	<c:param name="p" value="1"/>
	<c:param name="new" value="true"/>
	<c:param name="heading" value="${heading}"/>
</c:url>	

<c:url var="titleSearchUrl" value="SearchTitle.jsp">
</c:url>

<c:url var="platformSearchUrl" value="ListFilters.jsp">
	<c:param name="filter" value="platform"/>
</c:url>

<c:url var="publisherSearchUrl" value="ListFilters.jsp">
	<c:param name="filter" value="publisher"/>
</c:url>

<c:url var="genreSearchUrl" value="ListFilters.jsp">
	<c:param name="filter" value="genre"/>
</c:url>

<!-- Main page -->
<html>
<head>
  <%@ include file="Header.jspf" %>
  <title><fmt:message key="catalog.title"/></title>
</head>

<body>
<center>
<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
		<button class="tdButton" onclick="showHome()"><fmt:message key="all.home"/></button>
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('GameCatalog')"><fmt:message key="all.help"/></button>
	</TD>		
</TR>
</TABLE>
<H1><fmt:message key="catalog.title"/></H1>
<table>
<tr>
<td align="left">
<UL>
<LI><A HREF="<c:out value="${listAllUrl}"/>"><fmt:message key="catalog.listAll"/></A></LI>
<LI><A HREF="<c:out value="${listNewUrl}"/>"><fmt:message key="catalog.listNew"/></A></LI>
<LI><A HREF="<c:out value="${titleSearchUrl}"/>"><fmt:message key="catalog.titleSearch"/></A></LI>
<LI><A HREF="<c:out value="${platformSearchUrl}"/>"><fmt:message key="catalog.platformSearch"/></A></LI>
<LI><A HREF="<c:out value="${genreSearchUrl}"/>"><fmt:message key="catalog.genreSearch"/></A></LI>
<LI><A HREF="<c:out value="${publisherSearchUrl}"/>"><fmt:message key="catalog.publisherSearch"/></A></LI>
</UL>
</td>
</tr>
</table>

<br><br>
<button class="tdbutton" onclick="showBack()"><fmt:message key="all.back"/></button>
</center>
</body>
</html>