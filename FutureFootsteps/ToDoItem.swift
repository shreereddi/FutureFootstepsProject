//
//  ToDoItem.swift
//  FutureFootsteps
//
//  Created by Shreelakshya Reddi on 7/29/25.
//

import Foundation
import SwiftData

@Model
class ToDoItem {
    var title: String
    var isImportant: Bool
    var date: Date
    
    init(title: String, isImportant: Bool = false, date: Date) {
          self.title = title
          self.isImportant = isImportant
          self.date = date
    }
}
