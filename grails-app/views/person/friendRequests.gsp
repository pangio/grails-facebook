<%@ page import="org.grails.facebook.auth.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="person.friend.requests.label" /></title>
</head>

<body>
<div id="list-user" class="content scaffold-list" role="main">
    <h1><g:message code="person.friend.requests.label" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:if test="${friendRequestsList.size == 0}">
        <div class="message" role="status"><g:message code="person.no.requests.notification.label" /></div>
    </g:if>

    <g:else>
        <table>
            <thead>
            <tr>
                <g:sortableColumn property="avatarUrl" title="${message(code: 'person.avatar.label', default: 'Avatar')}"/>
                <g:sortableColumn property="realName" title="${message(code: 'person.requests.from.label', default: 'From')}"/>
                <g:sortableColumn property="accept" title="${message(code: 'person.requests.action.accept.label', default: 'Accept?')}"/>
                <g:sortableColumn property="deny" title="${message(code: 'person.requests.action.reject.label', default: 'Deny?')}"/>
            </tr>
            </thead>
            <tbody>
            <g:each in="${friendRequestsList}" status="i" var="friendRequest">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td><img height="40"  width="40" src="${resource(dir: 'images/avatars', file: "${friendRequest.from.avatarUrl}")}" /></td>
                    <td><strong>${fieldValue(bean: friendRequest, field: "from.realName")}</strong ></td>
                    <td><span><g:link controller="person" action="acceptFriendRequest" id="${friendRequest.id}"><g:message code="person.requests.action.accept.label" /></g:link></span></td>
                    <td><span><g:link controller="person" action="denyFriendRequest" id="${friendRequest.id}"><g:message code="person.requests.action.reject.label" /></g:link></span></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </g:else>

    <div class="pagination">
        <g:paginate total="${friendRequestsCount ?: 0}"/>
    </div>
</div>
</body>
</html>
