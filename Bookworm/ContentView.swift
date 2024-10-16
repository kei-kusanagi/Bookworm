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
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]

    @State private var showingAddScreen = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                    .foregroundColor(color(for: book.rating))
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)

            }
           .navigationTitle("Bookworm")
           .navigationDestination(for: Book.self) { book in
               DetailView(book: book)
           }
           .toolbar {
               ToolbarItem(placement: .topBarLeading) {
                   EditButton()
               }
               ToolbarItem(placement: .topBarTrailing) {
                   Button("Add Book", systemImage: "plus") {
                       showingAddScreen.toggle()
                   }
               }
               

           }
            
           .sheet(isPresented: $showingAddScreen) {
               AddBookView()
           }
       }
    }
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
    
    private func color(for rating: Int) -> Color {
        switch rating {
        case 1: return .red
        case 2: return .orange
        case 3: return .yellow
        case 4: return .cyan
        case 5: return .mint
        default: return .primary
        }
    }

}


#Preview {
    ContentView()
}
