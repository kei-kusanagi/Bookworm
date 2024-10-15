//
//  ContentView.swift
//  Bookworm
//
//  Created by Juan Carlos Robledo Morales on 14/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
