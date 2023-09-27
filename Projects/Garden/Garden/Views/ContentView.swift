//
//  ContentView.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 26/09/2023.
//

import SwiftUI

struct ContentView: View {

    @State private var data = ["a", "b", "c"]
    @State private var searchTerms = ""

    @State private var showForm = false

    @Binding var isLogged: Bool

    var body: some View {
        NavigationView {
            List {
                Section {
                    Button("Add") {
                        withAnimation {
                            data.append("d")
                        }
                    }
                    Button("logout") {
                        isLogged = false
                    }
                }
                Section {
                    ForEach(data, id: \.self) { i in
                        NavigationLink("\(i)", destination: DetailsView())
                    }
                }
                Section {
                    ForEach(data, id: \.self) { i in
                        TextField("", text: .constant("\(i)"))
                    }
                    .onDelete(perform: { indexSet in
                        data.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        data.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button("Test") {

                        }
                    }
                }
            }
            .refreshable {
                data = ["c", "d", "e"]
            }
            .searchable(text: $searchTerms)
            .navigationTitle("Garden")
            .sheet(isPresented: $showForm) {
                FormView(isLogged: $isLogged)
                    .presentationDetents([.large, .medium, .fraction(0.33)])
                    .presentationBackgroundInteraction(.enabled(upThrough: .fraction(0.33)))
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        showForm.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(isLogged: .constant(true))
}
