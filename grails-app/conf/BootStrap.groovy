import org.grails.facebook.auth.*
import org.grails.facebook.*

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        createPeople()
        createFriendRequests()

    }

    def destroy = {
    }

    private void createPeople() {
        def userRole = new Person(authority: 'ROLE_USER').save()

        String password = springSecurityService.encodePassword('pass')

        def user = new Person(
                avatarUrl: 'https://avatars2.githubusercontent.com/u/15482',
                username: 'jeff',
                realName: 'Jeff Brown',
                password: password,
                enabled: true).save()
        PersonAuthority.create user, userRole, true

        user = new Person(
                avatarUrl: 'https://avatars3.githubusercontent.com/u/66626',
                username: 'graeme',
                realName: 'Graeme Rocher',
                password: password,
                enabled: true).save()
        PersonAuthority.create user, userRole, true

        user = new Person(
                avatarUrl: 'https://avatars0.githubusercontent.com/u/67817',
                username: 'burt',
                realName: 'Burt Beckwith',
                password: password,
                enabled: true).save()
        PersonAuthority.create user, userRole, true

        user = new Person(
                avatarUrl: 'https://avatars2.githubusercontent.com/u/19075',
                username: 'peter',
                realName: 'Peter Ledbrook',
                password: password,
                enabled: true).save()
        PersonAuthority.create user, userRole, true

    }

    private createFriendRequests() {
        def userJeff = Person.findByUsername("jeff")
        def userBurt = Person.findByUsername("burt")
        def userGraeme = Person.findByUsername("graeme")

        new FriendRequest(
                from: userBurt,
                to: userJeff
        ).save(failOnError: true)

        new FriendRequest(
                from: userGraeme,
                to: userJeff
        ).save(failOnError: true)

    }

}
