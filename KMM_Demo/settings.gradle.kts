pluginManagement {
    repositories {
        google()
        gradlePluginPortal()
        mavenCentral()
//        enableFeaturePreview("GRADLE_METADATA")
    }
}

rootProject.name = "KMM_Demo"
include(":androidApp")
include(":shared")