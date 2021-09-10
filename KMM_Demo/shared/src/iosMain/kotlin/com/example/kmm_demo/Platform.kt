package com.example.kmm_demo

import platform.Foundation.NSUUID

actual class Platform {
    actual val uuid: String = NSUUID.UUID().UUIDString
}