//
//  Date+convertToString.swift
//  toDoApp
//
//  Created by camille_mille on 2017/7/7.
//  Copyright © 2017年 camille_mille. All rights reserved.
//



import Foundation

extension Date {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: self, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}

extension NSDate {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: (self as Date), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}
