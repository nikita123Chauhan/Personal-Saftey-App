buildscript {
    repositories {
        google()  // Required for Firebase & Play Services
        mavenCentral()  // Required for Kotlin & other dependencies
    }
    
    dependencies {
        //classpath("com.android.tools.build:gradle:8.1.2") // Android Gradle Plugin
        //classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.9.10") // Kotlin Plugin
        classpath("com.google.gms:google-services:4.4.2") // Google Services Plugin
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
