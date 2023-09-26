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

    var body: some View {
        NavigationView {
            List {
                Section {
                    Button("Add") {
                        withAnimation {
                            data.append("d")
                        }
                    }
                }
                Section {
                    ForEach(data, id: \.self) { i in
                        NavigationLink("\(i)", destination: Text("\(i)"))
                    }
                }
                Section {
                    ForEach(data, id: \.self) { i in
                        Text("\(i)")
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
            .listStyle(.insetGrouped)
            .refreshable {
                data = ["c", "d", "e"]
            }
            .searchable(text: $searchTerms)
            .navigationTitle("Garden")
        }
    }
}

#Preview {
    ContentView()
}
