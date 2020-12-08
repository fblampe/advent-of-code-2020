package de.flampe.adventofcode

import java.io.File

val REQUIRED_FIELDS = listOf("byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid")

fun main(args: Array<String>) {
    val passports = mutableListOf<String>()
    passports.add("")
    File("input").forEachLine {
        if (it.isBlank() && passports.last().isNotBlank()) {
            passports.add("")
        } else {
            val passportInfo = passports.removeLast() + " " + it
            passports.add(passportInfo.trim())
        }
    }
    println(passports)

    val validPassports = passports.count { passport -> passport.isValid() }
    println(validPassports)
}

private fun String.isValid(): Boolean {
    return REQUIRED_FIELDS.all { field -> this.contains(field) }
}
