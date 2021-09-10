package com.example.kmm_demo

import io.realm.RealmObject

class User: RealmObject {
    var id: String = Platform().uuid
    var email: String = ""
    var password: String = ""
}