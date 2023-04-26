// This program will read information from an input file
// it will then use recursion to calculate a power to
// a number

//
// Created by Melody Berhane

// Created on 2023-04-25

// Version 1.0

// Copyright (c) 2023 Melody. All rights reserved.
import Foundation

// Define input and output files.
let inputFile = "input.txt"
let outputFile = "output.txt"

// usage of file handle method to locate files,
// as well as opening input for file reading.
do {
    // Open input file for reading.
    guard let input = FileHandle(forReadingAtPath: inputFile) else {
        print("Error: cannot access input file for opening.")
        exit(1)
    }

    // Open output file for writing.
    guard let output = FileHandle(forWritingAtPath: outputFile) else {
        print("Error: cannot access output file for writing.")
        exit(1)
    }

    // Read content from file.
    let inputData = input.readDataToEndOfFile()

    // Convert data to a string.
    guard let inputString = String(data: inputData, encoding: .utf8) else {
        print("Error: Cannot convert input data to string.")
        exit(1)
    }

    // Splits string by newline.
    let inputLines = inputString.components(separatedBy: .newlines)

    // Create a 2D array.
    var inputLists: [[Int]] = []

    // Loop through each line of the input
    for line in inputLines {
        // Separate each line by spaces.
        let lineParts = line.components(separatedBy: " ")

        // Define empty list.
        var intList: [Int] = []

        // Loop through each part of the line.
        for part in lineParts {
            if let intValue = Int(part) {
                intList.append(intValue)
            } else {
                continue
            }
        }
        // Add the list of integers to the list.
        inputLists.append(intList)
    }

    // Loop through each list of integers.
    for intList in inputLists {
         
        if intList.count < 2 {
            // Write to file.
            let data3 = Data(("Invalid entry." + "\n").utf8)
            output.write(data3)
            continue
        }

        // Access at index 0 & 1.
        let base = intList[0]
        let exponent = intList[1]

        // Usage of if statement to determine
        // positive and negative values.
        if base >= 1 && exponent >= 0 {
            // Calls the function.
            let recPower = recPow(base: base, exponent: exponent)

            // Write results to the output file.
            let data4 = Data(("The number \(base)^\(exponent) is = \(recPower)" + "\n").utf8)
            output.write(data4)
        } else {
            // Display error & writes to file.
            let data5 = Data(("Invalid entry, positive values." + "\n").utf8)
            output.write(data5)
        }
    }
}
// This function calculates the power of a
// number recursively.
func recPow(base: Int, exponent: Int) -> Int {
    // Defines base case.
    if exponent == 0 {
        // Return 1 because anything to the power 0 is 1
        return 1
    } else {
        // Calls the function recursively & returns it.
        return base * recPow(base: base, exponent: exponent - 1)
    }
}