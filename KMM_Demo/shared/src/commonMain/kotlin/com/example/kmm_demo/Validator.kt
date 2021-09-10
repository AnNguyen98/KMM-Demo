package com.example.kmm_demo


enum class ValidCasePasswords {
    OneLowerCase, OneUppercase, OneNumeric, OneSpecial, EightCharacters;

    fun regex(): Regex {
        return when (this) {
            OneLowerCase -> Regex("^(?=.*[a-z])")       //The string must contain at least 1 lowercase alphabetical character
            OneUppercase -> Regex("^(?=.*[A-Z])")       //The string must contain at least 1 uppercase alphabetical character
            OneNumeric -> Regex("^(?=.*[0-9])")         //The string must contain at least 1 numeric character
            OneSpecial -> Regex("^(?=.*[!@#\$%^&*])")   //The string must contain at least one special character
            EightCharacters -> Regex("^(?=.{8,})")      //The string must be eight characters or longer
        }
    }
}

class Validator {
    fun validateEmailAddress(email: String): Boolean {
        val regexStr = "^(([^<>()\\[\\]\\\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))\$"
        return email.matches(Regex(regexStr))
    }

    fun validatePassword(password: String): List<ValidCasePasswords> {
        return ValidCasePasswords.values().filter { password.matches(it.regex()) }
    }

}