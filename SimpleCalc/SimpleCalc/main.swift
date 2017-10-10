//
//  main.swift
//  SimpleCalc
//
//  Created by zichu zheng on 10/10/17.
//  Copyright © 2017 zichu zheng. All rights reserved.
//

import Foundation

func getDouble() -> Double {
    let response = readLine(strippingNewline: true)!
    return Double(response)!
}

func doOp(op: String, first: Double, second: Double) -> Double {
    var result : Double
    switch op {
    case "+":
        result = first + second
    case "-":
        result = first - second
    case "*":
        result = first * second
    case "/":
        result = first / second
    case "%":
        result = Double(Int(first) % Int(second))
    default:
        result = 0
    }
    return result
}

func fact(num : Double) -> Double {
    if (num == 0) {
        return 1
    }
    return num * fact(num : num - 1)
}

// main start from here
print("Enter an expression separated by returns:")

let response = readLine(strippingNewline: true)!
let responseArr = response.characters.split(separator: " ").map(String.init)
if (responseArr.count == 1) {
    let firstNum = Double(response)!
    let op = readLine(strippingNewline: true)!
    let secondNum = getDouble()
    let result = doOp(op: op, first: firstNum, second: secondNum)
    print("Result: \(result)")
} else {
    switch responseArr[responseArr.count - 1] {
    case "count":
        print(responseArr.count - 1)
    case "avg":
        var sum = 0.0
        for i in 0...(responseArr.count - 2) {
            sum += Double(responseArr[i])!
        }
        print(Double(sum) / Double(responseArr.count - 1))
    case "fact":
        if (responseArr.count != 2) {
            print("fact can only accept one number")
            break
        }
        print(fact(num : Double(responseArr[0])!))
    default:
        print("not support")
    }
}





