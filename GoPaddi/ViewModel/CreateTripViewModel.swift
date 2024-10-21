//
//  CreateTripViewModel.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 20/10/2024.
//

import Foundation
import SwiftUI


class CreateTripViewModel: ObservableObject {
    //let postEndpoint = "https://tripps.free.beeceptor.com/create-trip"
    
    let postEndpoint = "https://saladel.free.beeceptor.com/create-trip"
    
    @Published var cityName: String = ""
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date().addingTimeInterval(5 * 24 * 60 * 60)
    @Published var tripName: String = ""
    @Published var tripStyle: DropdownMenuOption? = nil
    @Published var tripDescription: String = ""
    
    @Published var isLoading: Bool = false
    @Published var error: String?
    @Published var currentToast: Toast? // g
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    // g
    private func showToast(_ toast: Toast) {
        withAnimation {
            currentToast = toast
        }
        
        // Automatically dismiss the toast after a set duration
        DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration) {
            withAnimation {
                if self.currentToast?.message == toast.message {
                    self.currentToast = nil
                }
            }
        }
    }
    
    func createTrip() async {
        print("createTrip function called")
        
        func validateFields() throws {
            print("Validating fields...")
            
            guard !tripName.isEmpty else {
                print("Trip name is empty")
                throw CustomError.badRequest("Please fill in the trip name")
            }
            guard let tripStyle = tripStyle, !tripStyle.option.isEmpty else {
                print("Trip style is empty")
                throw CustomError.badRequest("Please select a trip style")
            }
            guard !tripDescription.isEmpty else {
                print("Trip description is empty")
                throw CustomError.badRequest("Please fill in the trip description")
            }
            
            print("Fields validated successfully")
        }
        
        // Validate fields
        //guard !tripName.isEmpty, ((tripStyle?.option.isEmpty) == nil), !tripDescription.isEmpty else {
        do {
            try validateFields()
        } catch {
            await DispatchQueue.main.async {
                self.showToast(Toast(
                    message: "Please fill in all required fields",
                    type: .error,
                    duration: 3
                ))
            }
            return
        }
        
        isLoading = true
        
        let trip = CreateTrip(
            id: UUID().uuidString,
            cityName: cityName,
            tripStartDate: dateFormatter.string(from: startDate),
            tripEndDate: dateFormatter.string(from: endDate),
            tripName: tripName,
            tripStyle: tripStyle?.option ?? "",
            tripDescription: tripDescription
        )
        
        do {
                try await createTripRequest(trip)
                isLoading = false
                showToast(Toast(message: "Trip created successfully!", type: .success, duration: 5))
            } catch let error as CustomError {
                isLoading = false
                showToast(Toast(message: error.localizedDescription, type: .error, duration: 5))
            } catch {
                isLoading = false
                showToast(Toast(message: "An unexpected error occurred. Please try again.", type: .error, duration: 5))
            }
    }
    
    private func createTripRequest(_ trip: CreateTrip) async throws {
        print("createTripRequest function called")
        
        guard let url = URL(string: postEndpoint) else {
            print("Invalid URL")
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(trip)
        print("Request body: \(String(data: request.httpBody ?? Data(), encoding: .utf8) ?? "")")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print("Response received")
        
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Invalid HTTP response")
            throw URLError(.badServerResponse)
        }
        
        print("HTTP status code: \(httpResponse.statusCode)")
        
        switch httpResponse.statusCode {
        case 200...299:
            if let successfulData = String(data: data, encoding: .utf8) {
                print(successfulData)
            } else {
                print("Failed to decode data to string.")
            }
            
        case 400:
            let errorMessage = "Bad Request: The server could not understand the request due to invalid syntax."
            print(errorMessage)
            throw CustomError.badRequest(errorMessage)
            
        case 401:
            let errorMessage = "Unauthorized: Please check your authentication credentials."
            print(errorMessage)
            throw CustomError.unauthorized(errorMessage)
            
        case 403:
            let errorMessage = "Forbidden: You do not have permission to access this resource."
            print(errorMessage)
            throw CustomError.forbidden(errorMessage)
            
        case 404:
            let errorMessage = "Not Found: The requested resource could not be found."
            print(errorMessage)
            throw CustomError.notFound(errorMessage)
            
        case 500:
            let errorMessage = "Internal Server Error: Something went wrong on the server."
            print(errorMessage)
            throw CustomError.internalServerError(errorMessage)
            
        default:
            let errorMessage = "Unexpected error: \(httpResponse.statusCode)"
            print(errorMessage)
            throw URLError(.badServerResponse)
        }
    }
}
