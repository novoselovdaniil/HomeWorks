//
//  main.swift
//  GeekbrainsLessonOne
//
//  Created by Даниил Новоселов on 10/6/19.
//  Copyright © 2019 Даниил Новоселов. All rights reserved.
//

import Foundation

var a : Float = 5
var b : Float = 8
var c : Float = 2
var x1 : Float
var x2 : Float

var discriminant  = sqrt(b) - 4 * a * c

if discriminant < 0 {
    print("Квадратное уровнение не имеет корней.")
    }
else {
    if discriminant >= 0 {
      x1 = (-b + sqrt(discriminant)) / (2 * a)
        x2 = (-b - sqrt(discriminant)) / (2 * a)
    }
}
print(discriminant)
// Задание 1


var f : Float = 5
var d : Float = 7
var S : Float = 1/2 * f * d
var P : Float = (f + d) * 2
var e : Float = P - ( a + b )

print(S)
print(P)
print(e)

// Задание 2


