<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="searchable.finding.friends.title" /></title>
</head>
<body>
        <g:each var="person" in="${searchResult?.results}" status="counter">
        <div id="search_result_${counter}">
            <span class="real_name">${person.realName}</span> <g:link id="${person.id}" action="sendFriendRequest" controller="person"><g:message code="searchable.send.friend.request.label" /></g:link>
            </div>
        </g:each>
</body>
</html>