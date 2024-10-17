//
//  AddBookView.swift
//  Bookworm
//
//  Created by Juan Carlos Robledo Morales on 15/10/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    private var canSave: Bool {
        !review.isEmpty && ( !title.isEmpty || !author.isEmpty || !review.isEmpty )
    }

    

    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                
                    Section("Write a review") {
                        TextEditor(text: $review)
                        RatingView(rating: $rating)
                    }
                        Button("Save") {
                            saveBook()
                        }
                        .disabled(!canSave)
                
                        Spacer()
                        Button("Cancel") {
                            dismiss()
                        }
                    
                
            }
            .navigationTitle("Add Book")
        }
    }
    
    private func saveBook() {

        let newBook = Book(
                   title: title.isEmpty ? "Unknown Title" : title,
                   author: author.isEmpty ? "Unknown Author" : author,
                   genre: genre.isEmpty ? "Unknown Genre" : genre,
                   review: review,
                   rating: rating
               )
               modelContext.insert(newBook)
               dismiss()
    }
}

#Preview {
    AddBookView()
}
