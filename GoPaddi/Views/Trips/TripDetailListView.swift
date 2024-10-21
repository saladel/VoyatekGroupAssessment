//
//  TripDetailListView.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 15/10/2024.
//

import SwiftUI


struct TripDetailListView: View {
    @ObservedObject var tdViewModel = TripDetailViewModel()
    
    var body: some View {
        ScrollView {
            if tdViewModel.isLoading {
                LazyVStack {
                    ForEach(tdViewModel.tripDetails, id: \.id) { tripDeets in
                        TripDetailCard(tripDetails: tripDeets)
                    }
                }
                .redacted(reason: .placeholder)
                .padding(.horizontal, 16)
                
            } else if tdViewModel.tripDetails.isEmpty {
                Text("No trip details available.")
                    .padding()
                
            } else {
                LazyVStack {
                    ForEach(tdViewModel.tripDetails, id: \.id) { tripDeets in
                        TripDetailCard(tripDetails: tripDeets)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .scrollIndicators(.hidden)
        .task {
            await tdViewModel.getTripDetail()
        }
    }
}


#Preview {
    TripDetailListView()
}
