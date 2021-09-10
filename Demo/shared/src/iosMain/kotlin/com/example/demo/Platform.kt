package com.example.demo

import platform.Foundation.NSUUID
import platform.UIKit.UIDevice

actual class Platform actual constructor() {
    actual val platform: String = UIDevice.currentDevice.systemName() + " " + UIDevice.currentDevice.systemVersion
    actual val uuid: String = NSUUID.UUID().UUIDString
}