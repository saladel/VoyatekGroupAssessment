//
//  TripDetailViewModel.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 15/10/2024.
//

import Foundation

@MainActor
class TripDetailViewModel: ObservableObject {
    @Published var tripDetails: [TripDetail] = []
    @Published var isLoading = false
    
    let endpoint = "https://saladel.free.beeceptor.com/my-trip"
    
    //let endpoint = "https://tripps.free.beeceptor.com/my-trip"
    
    func getTripDetail() async {
        guard let url = URL(string: endpoint) else {
            print("Invalid URL")
            return
        }
        
        isLoading = true
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let tripDetailResponse = try JSONDecoder().decode([TripDetail].self, from: data)
            tripDetails = tripDetailResponse
            print("CONSOLE: TRIP DETAILS: \(tripDetailResponse)")
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
        
        isLoading = false
    }
}
