<%@ include file="Common.jspf" %>

<jsp:useBean id="choices" class="com.broadon.cas.FilterBean" scope="request">
</jsp:useBean>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>Search by <c:out value="${param.filter}" /></title>
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

Select a <c:out value="${param.filter}" />
<TABLE>
	<c:forEach var="choice" items="${choices.filterList}">
        <TR>
        	<TD>
				<fmt:message var="heading" key="listTitles.filteredTitlesHeading">
					<fmt:param value="${param.filter}"/>
					<fmt:param value="${choice}"/>
				</fmt:message>	
        		<c:url var="listUrl" value="ListTitles.jsp">
					<c:param name="p" value="1"/>
					<c:param name="${param.filter}" value="${choice}" />
					<c:param name="heading" value="${heading}"/>
				</c:url>

        		<a href="<c:out value="${listUrl}" />">
	        		<c:out value="${choice}" />
        		</a>
        	</TD>
        </TR>
	</c:forEach>
</TABLE>

<BR><BR>
<button class="tdbutton" onclick="showBack()" id="ReturnButton"><fmt:message key="all.back"/></button>

</CENTER>

</body>
</html>