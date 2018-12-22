//: Playground - noun: a place where people can play

import UIKit

let calendar = Calendar.current
var dateComponents : DateComponents? = calendar.dateComponents([.hour, .minute, .second], from: Date())

dateComponents?.day = 30
dateComponents?.month = 12
dateComponents?.year = 2018

let date: Date? = calendar.date(from: dateComponents!)
print(date!)


