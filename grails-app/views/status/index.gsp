<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="title.what.are.you.doing.label" /></title>
    <g:javascript library="jquery" plugin="jquery" />
</head>
<body>
    <h1><g:message code="title.what.are.you.doing.label" /></h1>
    <div class="searchForm">
        <g:form controller="searchable" name="userSearchForm">
            <g:textField name="q" value="" placeholder="type name..."/>
            <g:submitButton name="${message(code: 'index.search.for.friends.label')}"  id="search_for_users_button"/>
        </g:form>
    </div>

    <h1><g:message code="title.what.are.you.doing.label" /></h1>
    <div class="updatStatusForm">
        <g:formRemote url="[action: 'updateStatus']" update="messages" name="updateStatusForm"
                      onSuccess="document.getElementById('message').value='';">
            <g:textArea name="message" value="" placeholder="your mood..."/><br/>
            <g:submitButton name="${message(code: 'index.update.my.mood.label')}" id="update_status_button"/>
        </g:formRemote>
    </div>
    <div id="messages">
        <facebook:renderMessages messages="${statusMessages}"/>
    </div>
</body>
</html>