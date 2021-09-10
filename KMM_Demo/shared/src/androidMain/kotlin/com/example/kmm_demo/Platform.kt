package com.example.kmm_demo

import java.util.*

actual class Platform {
    actual val uuid: String = UUID.randomUUID().toString()
}