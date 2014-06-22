package org.grails.facebook.auth

import org.grails.facebook.FriendRequest

class Person {

    String realName
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    static hasMany = [friends : Person]
	static searchable = [only: 'realName']

    String avatarUrl
    Set friends = new ArrayList<Person>()
    Set friendRequests = new ArrayList<FriendRequest>()

    static constraints = {
		username blank: false, unique: true
		password blank: false
        friends nullable: true
        friendRequests nullable: true
		avatarUrl blank: true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Authority> getAuthorities() {
		PersonAuthority.findAllByPerson(this).collect { it.authority } as Set
	}
}
