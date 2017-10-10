//
//  main.swift
//  SimpleCalc
//
//  Created by zichu zheng on 10/10/17.
//  Copyright © 2017 zichu zheng. All rights reserved.
//

import Foundation

func getInt() -> Int {
    let response = readLine(strippingNewline: true)!
    return Int(response)!
}

func doOp(op: String, first: Int, second: Int) -> Int {
    var result : Int
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
        result = first % second
    default:
        result = 0
    }
    return result
}

func fact(num : Int) -> Int {
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
    let firstNum = Int(response)!
    let op = readLine(strippingNewline: true)!
    let secondNum = getInt()
    let result = doOp(op: op, first: firstNum, second: secondNum)
    print("Result: \(result)")
} else {
    switch responseArr[responseArr.count - 1] {
    case "count":
        print(responseArr.count - 1)
    case "avg":
        var sum = 0
        for i in 0...(responseArr.count - 2) {
            sum += Int(responseArr[i])!
        }
        print(Double(sum) / Double(responseArr.count - 1))
    case "fact":
        if (responseArr.count != 2) {
            print("fact can only accept one number")
            break
        }
        print(fact(num : Int(responseArr[0])!))
    default:
        print("not support")
    }
}





