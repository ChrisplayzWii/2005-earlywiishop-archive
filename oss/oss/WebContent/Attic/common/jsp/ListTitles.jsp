<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>List Titles</title>
</head>

<jsp:useBean id="listTitles" class="com.broadon.cas.GameTitleListBean" scope="request">
</jsp:useBean>

<%
	pageContext.setAttribute("titleCount", String.valueOf(listTitles.getTitles().size()));
	pageContext.setAttribute("titleFirst", String.valueOf(listTitles.getPageSize()*(listTitles.getPage()-1)+1));
	pageContext.setAttribute("titleLast", String.valueOf(listTitles.getPageSize() * (listTitles.getPage() - 1) + listTitles.getTitles().size()));
%>

<body>
<CENTER>
<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
		<button class="tdButton" onclick="showHome()"><fmt:message key="all.home"/></button>
	</TD>
	<TD ALIGN="center">
		<H2><c:out value="${param.heading}" default="List Titles" /></H2>	
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('ListTitles')"><fmt:message key="all.help"/></button>
	</TD>		
</TR>
</TABLE>


<TABLE cellpadding="10">
<TR>

<c:choose>
<c:when test="${titleCount eq '0'}">
<fmt:message key="listTitles.noTitles" />
</c:when>
<c:otherwise>
<TD><fmt:message key="listTitles.title" /></TD>
<TD><fmt:message key="listTitles.platform" /></TD>
<TD><fmt:message key="listTitles.genre" /></TD>
<TD><fmt:message key="listTitles.titleSize" /></TD>
<TD><fmt:message key="listTitles.licenseType" /></TD>
<TD><fmt:message key="listTitles.points" /></TD>
<TD><fmt:message key="listTitles.publisher" /></TD>
<TD><fmt:message key="listTitles.ratings" /></TD></TR>
	<c:forEach var="title" items="${listTitles.titles}">
        <TR>
        	<TD>
				<c:url var="titleDetailsUrl" value="TitleDetails.jsp">
					<c:param name="titleId" value="${title.titleId}" />
				</c:url>
        	
        		<a href="<c:out value="${titleDetailsUrl}" />">
        			<c:out value="${title.name}" />
        		</a>
        	</TD>
	        <TD><c:out value="${title.platform}" /></TD>
	        <TD><c:out value="${title.genre}" /></TD>
    	    <TD><c:out value="${title.titleSize}" /></TD>
    	    <TD><c:out value="${title.licenseType}" /></TD>
    	    <TD><c:out value="${title.itemPrice}" /></TD>
	        <TD><c:out value="${title.publisher}" /></TD>
			<td>
				<c:forEach var="rating" items="${title.ratings}">
					<img src="<c:out value="${imagesPath}"/>/<c:out value="${rating.system}_${rating.value}" />.gif"
						alt="<c:out value="${rating.system} ${rating.value}" />">
					</img>	
				</c:forEach>				
			</td>	        
        </TR>
	</c:forEach>
</TABLE>

Titles <c:out value="${titleFirst}" /> - <c:out value="${titleLast}" />
of
<c:out value="${listTitles.totalCount}" /> 

<BR>

Page <c:out value="${listTitles.page}" />
/
<c:out value="${listTitles.pageCount}" />
</c:otherwise>
</c:choose>

<BR>

<TABLE WIDTH=100%>
<TR>
<TD ALIGN="left">
<c:if test="${listTitles.page > 1}">
	<c:url var="prevUrl" value="ListTitles.jsp">
		<c:forEach var="parameter" items="${paramValues}">
			<c:if test="${parameter.key ne 'p'}">
				<c:forEach var="val" items="${parameter.value}">
					<c:param name="${parameter.key}" value="${val}" />
			   </c:forEach>
		   </c:if>
	   </c:forEach>
		<c:param name="p" value="${listTitles.page-1}" />
	</c:url>

	<button class="tdbutton" onclick="location.replace('<c:out value="${prevUrl}" />')">
	Prev Page
    </button>
</c:if>
</TD>

<TD ALIGN="right">
<c:if test="${listTitles.page < listTitles.pageCount}">
	<c:url var="nextUrl" value="ListTitles.jsp">
		<c:forEach var="parameter" items="${paramValues}">
			<c:if test="${parameter.key ne 'p'}">
				<c:forEach var="val" items="${parameter.value}">
					<c:param name="${parameter.key}" value="${val}" />
			   </c:forEach>
		   </c:if>
	   </c:forEach>
		<c:param name="p" value="${listTitles.page+1}" />
	</c:url>

	<button class="tdbutton" onclick="location.replace('<c:out value="${nextUrl}" />')">
	Next Page
    </button>
</c:if>
</TD>
</TR>
</TABLE>

<BR><BR>
<button class="tdbutton" onclick="showBack()"><fmt:message key="all.back"/></button>

</CENTER>


</body>
</html>