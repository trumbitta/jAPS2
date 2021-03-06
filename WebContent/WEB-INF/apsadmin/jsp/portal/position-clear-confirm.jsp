<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="aps-core.tld" prefix="wp" %>
<%@ taglib uri="apsadmin-form.tld" prefix="wpsf" %>

<s:set name="NScurrent" value="#context['struts.actionMapping'].getNamespace()" />

<s:if test="%{#NScurrent == '/do/Portal/ShowletType'}">
<h1><a href="<s:url action="viewShowlets" namespace="/do/Portal/ShowletType" />" title="<s:text name="note.goToSomewhere" />: <s:text name="title.showletManagement" />"><s:text name="title.showletManagement" /></a></h1>
</s:if>
<s:elseif test="%{#NScurrent == '/do/Page'}">
<h1><a href="<s:url action="viewTree" namespace="/do/Page" />" title="<s:text name="note.goToSomewhere" />: <s:text name="title.pageManagement" />"><s:text name="title.pageManagement" /></a></h1>
</s:elseif>

<div id="main">

<h2><s:text name="title.showletManagement.position.clear" /></h2>

<s:form action="deleteShowletFromPage">
<p class="noscreen">
	<wpsf:hidden name="pageCode"/>
	<wpsf:hidden name="frame" />
	<wpsf:hidden name="showletTypeCode" />
</p>

<p>
	<s:text name="note.clearPosition.areYouSure.position" />&#32;<em class="important">&#32;<s:property value="frame" />&#32;&ndash;&#32;<s:property value="%{getPage(pageCode).model.getFrames()[frame]}"/></em>
	<s:text name="note.clearPosition.areYouSure.page" />&#32;<em class="important"><s:property value="%{getPage(pageCode).getTitle(currentLang.getCode())}" /></em>
	<s:set var="showletType" value="%{getShowletType(showletTypeCode)}"></s:set>
	<s:if test="null != #showletType">
		<s:text name="note.clearPosition.areYouSure.showlet" />&#32;<em class="important"><s:property value="%{getTitle(#showletType.getCode(), #showletType.getTitles())}" /></em>
	</s:if>	
	?
	<wpsf:submit value="%{getText('label.clear')}" cssClass="button" />
</p>
</s:form>

</div>