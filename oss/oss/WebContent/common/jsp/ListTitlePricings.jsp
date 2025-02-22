<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>List Titles</title>
</head>

<jsp:useBean id="listTitles" class="com.broadon.cas.GameTitleListPricingsBean" scope="request">
</jsp:useBean>

<c:set var="titleCount" value="${listTitles.pageCount}" />
<c:set var="titleFirst" value="${listTitles.firstEntryIndex}" />
<c:set var="titleLast" value="${listTitles.lastEntryIndex}" />

<c:url var="listUrl" value="ListTitlePricings.jsp">
	<c:forEach var="parameter" items="${paramValues}">
		<c:if test="${parameter.key ne 'p'}">
			<c:forEach var="val" items="${parameter.value}">
				<c:param name="${parameter.key}" value="${val}" />
		   </c:forEach>
	   </c:if>
   </c:forEach>
</c:url>

<body>
<CENTER>
<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
		<button class="tdButton" onclick="showHome()"><fmt:message key="button.home"/></button>
	</TD>
	<TD ALIGN="center">
		<H2>
			<c:out value="${param.heading}" default="List Titles" />
		</H2>	
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('ListTitles')"><fmt:message key="button.help"/></button>
	</TD>		
</TR>
</TABLE>


<TABLE cellpadding="10">
<TR>

<c:if test="${not empty age}">
	<fmt:message key="listTitles.titlesAreFiltered">
		<fmt:param value="${age}" />
	</fmt:message>
	<BR>
</c:if>

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
<TD><fmt:message key="all.points" /></TD>
<TD><fmt:message key="listTitles.publisher" /></TD>
<TD><fmt:message key="listTitles.ratings" /></TD></TR>
<c:catch var="error">
	<c:forEach var="titlePricing" items="${listTitles.titles}">		
        <TR>
        	<c:set var="title" value="${titlePricing.title}"/>
        	<c:set var="pricing" value="${titlePricing.pricing}"/>
        	<TD>
				<c:url var="titleDetailsUrl" value="TitleDetails.jsp">
					<c:param name="titleId" value="${title.titleId}" />
					<c:param name="itemId" value="${pricing.itemId}" />
				</c:url>
        	
        		<a href="<c:out value="${titleDetailsUrl}" />">
        			<c:out value="${title.name}" />
        		</a>
        	</TD>
	        <TD><c:if test="${not empty title.platform}">
	        		<fmt:message key="${title.platform}"/>
	        	</c:if>
	        </TD>
	        <TD><c:if test="${not empty title.genres}">
	        		<c:forEach var="genre" items="${title.genres}">
			        	<fmt:message key="${genre}" />
					</c:forEach>			        	
		        </c:if>
	        </TD>
    	    <TD><c:out value="${title.titleSize}" /></TD>
    	    <TD><c:if test="${not empty pricing.licenseType}">
    	    	<fmt:message key="${pricing.licenseType}" />
    	    	</c:if>
    	    </TD>
    	    <TD><c:out value="${pricing.itemPrice}" /></TD>
	        <TD><c:if test="${not empty title.publisher}">
	        		<fmt:message key="${title.publisher}" />
	        	</c:if>
	        </TD>
			<td>
				<c:forEach var="rating" items="${title.ratings}">
					<img height=20 src="<c:out value="${imagesPath}"/>/<c:out value="${rating.system}_${rating.value}" />.gif"
						alt="<c:out value="${rating.system} ${rating.value}" />">
					</img>	
				</c:forEach>				
			</td>	        
        </TR>
	</c:forEach>
</c:catch>
<c:if test="${not empty error}">
	<c:out value="${error}"/>
</c:if>
	
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
	<c:url var="prevUrl" value="${listUrl}">
		<c:param name="p" value="${listTitles.page-1}" />
	</c:url>

	<button class="tdbutton" onclick="location.replace('<c:out value="${prevUrl}" />')">
	Prev Page
    </button>
</c:if>
</TD>

<TD ALIGN="right">
<c:if test="${listTitles.page < listTitles.pageCount}">
	<c:url var="nextUrl" value="${listUrl}">
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
<button class="tdbutton" onclick="showBack()"><fmt:message key="button.back"/></button>

</CENTER>


</body>
</html>