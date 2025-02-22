//
//  DateExtension .swift
//  fitness track (chapt 2)
//  Created by Joanne on 2/12/25.
//
//import SwiftUI

import Foundation

extension Date {
    func formatted(as format: String) -> String {
      let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

