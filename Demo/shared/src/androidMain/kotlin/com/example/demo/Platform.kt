package com.example.demo

import java.util.*

actual class Platform actual constructor() {
    actual val platform: String = "Android ${android.os.Build.VERSION.SDK_INT}"
    actual val uuid: String = UUID.randomUUID().toString()
}