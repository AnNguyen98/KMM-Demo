package com.example.demo.model

import com.example.demo.Platform
import io.realm.RealmObject

open class User: RealmObject {
    open val id: String = Platform().uuid
    open var email: String = ""
    open var password: String = ""

    companion object {
        private const val PROFILE_URL = "https://covers.openlibrary.org/b/id/"
    }
}
