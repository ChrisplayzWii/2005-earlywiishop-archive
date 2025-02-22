<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title><fmt:message key="listTransactions.title"/></title>
</head>

<jsp:useBean id="listTransactions" class="com.broadon.oss.TransactionListBean" scope="session">
</jsp:useBean>
<c:url var="listUrl" value="ListTransactions.jsp">
	<c:forEach var="parameter" items="${paramValues}">
		<c:if test="${parameter.key ne 'p'}">
			<c:forEach var="val" items="${parameter.value}">
				<c:param name="${parameter.key}" value="${val}" />
		   </c:forEach>
	   </c:if>
   </c:forEach>
</c:url>

<c:url var="prevUrl" value="${listUrl}">
	<c:param name="p" value="${listTransactions.page-1}" />
</c:url>

<c:url var="nextUrl" value="${listUrl}">
	<c:param name="p" value="${listTransactions.page+1}" />
</c:url>

<script type="text/javascript">

function prevPage()
{
  	window.location="<c:out value='${prevUrl}'/>"
}

function nextPage()
{
  	window.location="<c:out value='${nextUrl}'/>"
}
</script>

<body>
<center>

<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
		<button class="tdButton" onclick="showHome()"><fmt:message key="button.home"/></button>
	</TD>
	<TD ALIGN="center">
		<H2><fmt:message key="listTransactions.heading"/></H2>	
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('ListTransactions')"><fmt:message key="button.help"/></button>
	</TD>		
</TR>
</TABLE>

<TABLE cellSpacing=0 cellPadding=1 width=90% align=center bgColor="#336699" border=0>
  <TR> 
    <TD>
      <A name="List_of_transactions"></a>
      <!-- List of Transactions -->
      <TABLE cellSpacing=0 cellPadding=1 width="100%" bgColor=#336699 border=0>
        <TR> 
          <TD bgColor=#efefef>
            <TABLE cellSpacing="1" cellPadding="4" width="100%" border="0" align="center">
              <TR>
                  <TD class="columnHeader"><fmt:message key="listTransactions.no"/></TD>
              	  <TD class="columnHeader"><fmt:message key="listTransactions.transDate"/></TD>
                  <TD class="columnHeader"><fmt:message key="listTransactions.transType"/></TD>
                  <TD class="columnHeader"><fmt:message key="listTransactions.amount"/></TD>
                  <TD class="columnHeader"><fmt:message key="listTransactions.balance"/></TD>           
              </TR> 
	      <c:choose>
                <c:when test="${listTransactions.pageCount == 0}">
                  <tr class="whiterow" align="center"><td colspan=5><fmt:message key="listTransactions.noTransactions"/></td></tr>
                </c:when>
                <c:otherwise>
 	          <c:forEach var="transaction" items="${listTransactions.transactions}" varStatus="status" >
	            <c:choose>
                      <c:when test="${(status.index mod 2) == 0}">
   	                <tr class="whiterow" align="center">
                      </c:when>
                      <c:otherwise>
   	                <tr class="colorrow" align="center">
                      </c:otherwise>
                    </c:choose>
 	            <td nowrap="true"><c:out value="${(listTransactions.page-1)*listTransactions.pageRows+status.count}"/></td>
	            <td nowrap="true"><fmt:formatDate value="${transaction.transDate}" type="both" dateStyle="short" timeStyle="short"/></td>
	            <td nowrap="true"><c:out value="${transaction.transType}"/></td>
	            <td nowrap="true">
	              <c:choose>
	                <c:when test="${!transaction.credit}">
	                  <font color=red>(<c:out value="${transaction.totalAmount}"/>)</font>
	                </c:when>
	                <c:otherwise>
	                  <c:out value="${transaction.totalAmount}"/></td>
	                </c:otherwise>
	              </c:choose>
	            <td nowrap="true"><c:out value="${transaction.balance}"/></td>
                    </tr>
	          </c:forEach>
                </c:otherwise>
              </c:choose> 
            </TABLE>
          </TD>
        </TR>  
        <TR bgColor=#FFFFFF> 
          <TD width="100%"> 
            <TABLE cellSpacing=1 cellPadding=4 width="100%" bgColor=#FFFFFF>
              <TR>
                
                  <TD align=left width="50%" bgColor=#FFFFFF>
                    <FONT class="tableSubHeaderLabelB">
                      <fmt:message key="listTransactions.endBalance"/>:&nbsp;&nbsp;<c:out value="${listTransactions.balance.amount}"/>&nbsp;&nbsp;<c:out value="${listTransactions.balance.currency}"/>
                    </FONT>
                  </TD>
                  <TD align=right width="50%" bgColor=#FFFFFF><FONT class="tableSubHeaderLabelB"><c:out value="${listTransactions.page}"/>/<c:out value="${listTransactions.pageCount}"/>&nbsp;&nbsp;<fmt:message key="listTransactions.pages"/></FONT></TD>
                
              </TR>
             </TABLE>

          </TD>
        </TR>
      </TABLE>
    </TD>
  </TR>
</TABLE>
<p>
<table BORDER=0 width="100%" cellspacing=0 cellpadding=4>
  <tr>
    <td align=left>
      <button class="tdbutton" onclick="showBack()"><fmt:message key="button.back"/></button>
    </td>
    <td align=right>
      <c:if test="${listTransactions.page > 1}">
        <button class="tdbutton" onclick="prevPage()"><fmt:message key="listTransactions.prevPage"/></button>
      </c:if>
      <c:if test="${listTransactions.page < listTransactions.pageCount}">
        <button class="tdbutton" onclick="nextPage()"><fmt:message key="listTransactions.nextPage"/></button>
      </c:if>
    </td>
  </tr>
</table>



</center>

</body>
</html>
