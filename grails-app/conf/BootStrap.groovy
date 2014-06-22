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
                avatarUrl: 'rocky.jpg',
                username: 'rocky',
                realName: 'Rocky Balboa',
                password: password,
                enabled: true).save()
        PersonAuthority.create user, userRole, true

        user = new Person(
                avatarUrl: 'ali.jpg',
                username: 'ali',
                realName: 'Mohamed Ali',
                password: password,
                enabled: true).save()
        PersonAuthority.create user, userRole, true

        user = new Person(
                avatarUrl: 'tyson.jpeg',
                username: 'tyson',
                realName: 'Mike Tyson',
                password: password,
                enabled: true).save()
        PersonAuthority.create user, userRole, true

        user = new Person(
                avatarUrl: 'chuck.jpg',
                username: 'chuck',
                realName: 'Chuck Norris',
                password: password,
                enabled: true).save()
        PersonAuthority.create user, userRole, true

    }

    private createFriendRequests() {
        def userTyson = Person.findByUsername("tyson")
        def userRocky = Person.findByUsername("rocky")
        def userChuck = Person.findByUsername("chuck")

        new FriendRequest(
                from: userRocky,
                to: userTyson
        ).save(failOnError: true)

        new FriendRequest(
                from: userChuck,
                to: userTyson
        ).save(failOnError: true)

    }

}
