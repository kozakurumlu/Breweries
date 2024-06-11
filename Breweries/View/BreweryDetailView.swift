//
//  BreweryDetailView.swift
//  Breweries
//
//  Created by Kurumlu, Koza (RCH) on 11/06/2024.
//

import SwiftUI

struct BreweryDetailView: View {
    let breweryWebAdaptor = BreweryWebAdaptor.shared
    let breweryID: String
    let data: Brewery = Brewery(id: "", name: "", brewery_type: "", address_1: "", address_2: "", address_3: "", city: "", state_province: "", postal_code: "", country: "", longitude: "", latitude: "", phone: "", website_url: "", state: "", street: "")
    var body: some View {
        VStack {
            Text("\(data)", breweryID)
            
        }
        .onAppear { newValue
            breweryWebAdaptor.getBreweryDate(for: newValue) {results in
                data = results
            }
        }
    }
}

#Preview {
    BreweryDetailView(breweryID: "Kobe")
}
