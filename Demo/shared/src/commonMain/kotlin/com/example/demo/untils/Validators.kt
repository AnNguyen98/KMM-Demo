package com.example.demo.untils

enum class ValidCasePasswords {
    OneLowerCase, OneUppercase, OneNumeric, OneSpecial, EightCharactersNoSpace;

    fun regex(): Regex {
        return when (this) {
            OneLowerCase -> "[a-z]".toRegex()       //The string must contain at least 1 lowercase alphabetical character
            OneUppercase -> "[A-Z]".toRegex()     //The string must contain at least 1 uppercase alphabetical character
            OneNumeric -> "[0-9]".toRegex()       //The string must contain at least 1 numeric character
            OneSpecial -> "[!@#\$%^&*]".toRegex()   //The string must contain at least one special character
            EightCharactersNoSpace -> "\\w{8,}".toRegex()    //The string must be eight characters or longer
        }
    }
}

class Validators {
    fun validateEmailAddress(email: String): Boolean {
        val regex = "[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\\.[a-zA-Z.]{2,18}".toRegex()
        return regex.matches(email)
    }

    fun validatePassword(password: String): List<ValidCasePasswords> {
        return ValidCasePasswords.values().filter { it.regex().containsMatchIn(password) }
    }
}