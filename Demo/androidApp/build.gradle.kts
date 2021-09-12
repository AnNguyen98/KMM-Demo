plugins {
    id("com.android.application")
    kotlin("android")
    id("kotlin-android-extensions")
}

val compose_version = "1.1.0-alpha03"

dependencies {
    implementation(project(":shared"))
    implementation("com.google.android.material:material:1.3.0")
    implementation("androidx.appcompat:appcompat:1.2.0")
    implementation("androidx.constraintlayout:constraintlayout:2.0.4")
    compileOnly("io.realm.kotlin:library:0.4.1")

    implementation("androidx.core:core-ktx:1.6.0")
    implementation("androidx.appcompat:appcompat:1.3.1")
    implementation ("com.google.android.material:material:1.4.0")
    implementation("androidx.compose.ui:ui:$compose_version")
    implementation("androidx.compose.material:material:$compose_version")
    implementation("androidx.compose.ui:ui-tooling-preview:$compose_version")
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.3.1")
    implementation("androidx.activity:activity-compose:1.3.0-alpha06")
    testImplementation("junit:junit:4.+")
    androidTestImplementation("androidx.test.ext:junit:1.1.3")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.4.0")
    androidTestImplementation("androidx.compose.ui:ui-test-junit4:$compose_version")
    debugImplementation("androidx.compose.ui:ui-tooling:$compose_version")
    implementation("io.coil-kt:coil-compose:1.3.1")

    implementation("androidx.compose.runtime:runtime:1.1.0-alpha03")
    implementation("androidx.compose.runtime:runtime-livedata:1.1.0-alpha03")
    implementation("androidx.compose.runtime:runtime-rxjava2:1.1.0-alpha03")

    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.5.0-native-mt")

//    implementation("com.google.accompanist:accompanist-swiperefresh:0.10.0")
//    implementation("androidx.swiperefreshlayout:swiperefreshlayout:1.1.0")
}

android {
    buildFeatures {
        compose = true
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    composeOptions {
        kotlinCompilerExtensionVersion = compose_version
    }
    compileSdkVersion(31)
    defaultConfig {
        applicationId = "com.example.demo.android"
        minSdkVersion(24)
        targetSdkVersion(31)
        versionCode = 1
        versionName = "1.0"
    }
    kotlinOptions {
        jvmTarget = "1.8"
    }
    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
        }
    }
}