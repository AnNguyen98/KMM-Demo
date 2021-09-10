package com.example.kmm_demo

import io.realm.Realm
import io.realm.RealmConfiguration
import io.realm.delete


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