//
//  Student.swift
//  Bookworm
//
//  Created by Juan Carlos Robledo Morales on 14/10/24.
//


import Foundation
import SwiftData


@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
