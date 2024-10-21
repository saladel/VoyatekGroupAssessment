//
//  CitySearchView.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 20/10/2024.
//

import SwiftUI

struct CitySearchView: View {
    @StateObject private var viewModel: CreateTripViewModel
    
    init(viewModel: CreateTripViewModel = CreateTripViewModel()) {
            _viewModel = StateObject(wrappedValue: viewModel)
        }
    
    @Environment (\.dismiss) var dismiss
    @State private var searchText = ""
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            GPHeader(leftHeaderTitle: "Where", leftAction: {dismiss()}, leftIcon: .asset(name: "xmark"), bottomPaddingRelatingToHeaderTitle: 0, spacingBetweenLeftIconAndLeftHeaderTitle: 12)
                .padding(.top, 0)
                .frame(maxHeight: 62)
                .padding(.horizontal)
            
            Divider()
                .padding(.bottom, 20)
            
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 14) {
                    Text("Please select a city")
                        .designSystemTypography(.tripSD, color: .whereto)
                    
                    TextField("Search for a city", text: $searchText)
                    TextField(viewModel.cityName.isEmpty ? "Search for a city" : viewModel.cityName, text: $searchText)
                        .designSystemTypography(.placeHolderSearchText, color: .gpBlack)
                        .padding(.leading, 20)
                        .padding(.vertical, 26)
                        .frame(height: 76)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2)
                            .stroke(isTextFieldFocused ? .gpBlue : Color.gray, lineWidth: 1)
                        )
                        .focused($isTextFieldFocused)
                    
                    CountryListView(searchText: $searchText) { city in
                        viewModel.cityName = city.name // Update viewModel.cityName when a city is selected
                        print("Selected city: \(city.name), \(city.country)")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CitySearchView()
}
