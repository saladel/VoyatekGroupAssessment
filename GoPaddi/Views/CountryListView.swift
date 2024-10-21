//
//  CountryListView.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 19/10/2024.
//

import SwiftUI

struct CountryListView: View {
    @Environment (\.dismiss) var dismiss
    
    @Binding var searchText: String
    
    let cities = [
        City(name: "Laghouat", capital: "Laghouat", country: "Algeria", countryCode: "DZ", countryFlag: Image("DZ")),
        City(name: "Lagos", capital: "Murtala Muhammed", country: "Nigeria", countryCode: "NG", countryFlag: Image("NG")),
        City(name: "Doha", capital: "Doha", country: "Qatar", countryCode: "QA", countryFlag: Image("QA"))
    ]
    
    var onSelectCity: (City) -> Void
    
    public var filteredCities: [City] {
        cities.filter { searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        List(filteredCities) { city in
            HStack {
                Image("MapPinFill")
                
                VStack(alignment: .leading) {
                    Text(city.name + ", " + city.country)
                        .designSystemTypography(.tripNm)
                    
                    Text(city.capital)
                        .designSystemTypography(.tripSD, color: .gpGray2)
                }
                .padding(.leading, 18)
                
                Spacer()
                
                VStack {
                    city.countryFlag
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 11, height: 16)
                    
                    Text(city.countryCode)
                        .designSystemTypography(.tripSD, color: .gpGray2)
                }
            }
            .listRowSeparator(.hidden)
            .onTapGesture {
                onSelectCity(city) // Calls the callback when a city is tapped
            }
        }
        .listStyle(.plain)
    }
}


struct CountryListView_Previews: PreviewProvider {
    
    static var previews: some View {
        @State  var searchText = ""
        CountryListView(searchText: $searchText, onSelectCity: {_ in })
    }
}
