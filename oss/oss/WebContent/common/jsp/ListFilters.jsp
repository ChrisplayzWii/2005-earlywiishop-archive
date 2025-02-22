<%@ include file="Common.jspf" %>

<jsp:useBean id="choices" class="com.broadon.cas.FilterBean" scope="request">
</jsp:useBean>

<fmt:message key="all.${param.filter}" var="filterName"/>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>
  	<fmt:message key="listFilters.searchBy">
  		<fmt:param value="${filterName}" />
	</fmt:message>
  </title>
</head>

<body>

<CENTER>

<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
		<button class="tdButton" onclick="showHome()"><fmt:message key="button.home"/></button>
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('SearchTitle')"><fmt:message key="button.help"/></button>
	</TD>		
</TR>
</TABLE>

<fmt:message key="listFilters.selectFilter">
	<fmt:param value="${filterName}" />
</fmt:message>
<TABLE>
	<c:forEach var="choice" items="${choices.filterList}">
		<c:if test="${not empty choice}">
        <TR>
        	<TD>        	
         		<fmt:message key="${choice}" var="choiceName"/>
				<fmt:message var="heading" key="listTitles.filteredTitlesHeading">
					<fmt:param value="${filterName}"/>
					<fmt:param value="${choiceName}"/>
				</fmt:message>	
        		<c:url var="listUrl" value="ListTitles.jsp">
					<c:param name="p" value="1"/>
					<c:param name="${param.filter}" value="${choice}" />
					<c:param name="heading" value="${heading}" />
					<c:param name="license" value="PERMANENT" />
					<c:param name="license" value="RENTAL" />
				</c:url>

        		<a href="<c:out value="${listUrl}" />">
        			<c:out value="${choiceName}" />
        		</a>
        	</TD>
        </TR>
        </c:if>
	</c:forEach>
</TABLE>

<BR><BR>
<button class="tdbutton" onclick="showBack()" id="ReturnButton"><fmt:message key="button.back"/></button>

</CENTER>

</body>
</html>