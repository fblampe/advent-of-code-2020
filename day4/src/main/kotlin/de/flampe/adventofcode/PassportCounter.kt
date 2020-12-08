package de.flampe.adventofcode

import java.io.File

val REQUIRED_FIELDS = listOf("byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid")

fun main() {
    val passports = File("input").readText().split("\n\n")
    println(passports)

    val validPassports = passports.count { passport -> passport.isValid() }
    println("Number of valid passports: $validPassports!")
}

private fun String.isValid(): Boolean {
    return REQUIRED_FIELDS.all { field -> this.contains(field) }
}
