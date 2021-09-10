package com.example.demo

import io.realm.*

class RealmDatabase {
    private val realm: Realm by lazy {
        val configuration = RealmConfiguration(schema = setOf(User::class))
        Realm(configuration)
    }

    fun getUser(): User {
        return realm.objects(User:: class).first()
    }

    fun addUser(user: User) {
        realm.writeBlocking {
            copyToRealm(user)
        }
    }

    fun deleteUser(id: String) {
        realm.writeBlocking {
            objects(User:: class).query("id=$id").first().delete()
        }
    }

    fun deleteAll() {
        realm.writeBlocking {
            objects(User:: class).delete()
        }
    }
}