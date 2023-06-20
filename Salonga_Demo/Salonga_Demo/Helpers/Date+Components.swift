//
//  Date+Components.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/20/23.
//

import UIKit

extension Date {
    
    var yearString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self)
    }
    
    init(from dateString: String, with format: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from:dateString) {
            self = date
        } else {
            self = Date()
        }
    }
    
    func string(with format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}

