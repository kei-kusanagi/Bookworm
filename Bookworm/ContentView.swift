//
//  ContentView.swift
//  Bookworm
//
//  Created by Juan Carlos Robledo Morales on 14/10/24.
//

import SwiftUI


struct ContentView: View {
    @AppStorage("notes") private var notes = ""

    var body: some View {
        NavigationStack {
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
        }
    }
}



#Preview {
    ContentView()
}
