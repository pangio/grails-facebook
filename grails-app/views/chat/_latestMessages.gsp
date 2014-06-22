<g:each in="${messages}" var="message">
    <div class="chatBoxContainer">
    	<table border="0" width="100%">
    		<tr>
                <td><img height="40" width="40" src="${resource(dir: 'images/avatars', file: "${message.author.avatarUrl}")}"  /></td>
    			<td width="150"><span class="author"><strong>${message.author.realName}</strong></span></td>
    			<td width="350"><span class="statusMessage">${message.message}</span></td>
    			<td width="150"><span class="messageTime"><prettytime:display class="statusMessageTime" date="${message.dateCreated}" /></span></td>
    		</tr>
    	</table>
    </div>
</g:each>