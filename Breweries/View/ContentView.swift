//
//  ContentView.swift
//  Breweries
//
//  Created by Kurumlu, Koza (RCH) on 11/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var search: String = ""
    let breweryWebAdaptor = BreweryWebAdaptor.shared
    @State private var breweries: [BreweryLightweight] = []
    var body: some View {
        NavigationStack {
            TextField("Enter Brewery", text: $search)
                .onChange(of: search){ oldValue, newValue in
                    breweryWebAdaptor.search(for: newValue) {results in
                        breweries = results
                    }
                }
            Text("List of Breweries")
            
            List{
                ForEach(breweries, id:\.id) {brewery in
                    NavigationLink("\(brewery.name)") {
                        BreweryDetailView(breweryID: brewery.id)
                    }
                }
            }
            .navigationTitle("Brewery API")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
