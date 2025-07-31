//
//  UserSession.swift
//  FutureFootsteps
//
//  Created by Saanvi Chiluveru on 7/30/25.
//

import Foundation
import SwiftData

@Model
class UserSession {
    var id: UUID
    var lastLoginDate: Date
    var loginStreak: Int

    init(id: UUID = UUID(), lastLoginDate: Date = Date(), loginStreak: Int = 1) {
        self.id = id
        self.lastLoginDate = lastLoginDate
        self.loginStreak = loginStreak
    }
}
