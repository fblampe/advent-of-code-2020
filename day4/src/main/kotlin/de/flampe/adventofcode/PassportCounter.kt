package de.flampe.adventofcode

import java.io.File

val REQUIRED_FIELDS = listOf("byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid")

fun main(args: Array<String>) {
    val passports = mutableListOf<String>()
    passports.add("")
    val lines = File("input").forEachLine {
        if (it.isBlank() && passports.last().isNotBlank()) {
            passports.add("")
        } else {
            val passportInfo = passports.removeLast() + " " + it
            passports.add(passportInfo.trim())
        }
    }

    var validPassports = 0
    for (passport in passports) {
        if (passport.isValid()) {
            validPassports++
        }
    }

    println(passports)
    println(validPassports)
}

private fun String.isValid(): Boolean {
    var containsAllFields = true
    for (field in REQUIRED_FIELDS) {
        containsAllFields = containsAllFields.and(this.contains(field))
    }
    return containsAllFields
}
