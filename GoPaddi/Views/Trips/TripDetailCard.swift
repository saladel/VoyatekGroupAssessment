//
//  TripCard.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 10/10/2024.
//

import SwiftUI

struct TripDetailCard: View {
    let tripDetails: TripDetail
    var body: some View {
        VStack {
            // Image
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: tripDetails.image ?? "https://placebear.com/450/450")) { image in
                    image
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .frame(maxHeight: 230)
                } placeholder: {
                    Image(systemName: "airplane.departure")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .frame(height: 230)
                        .redacted(reason: .placeholder)
                }
                .padding(.bottom, 14)
                
                // Trip Destination
                Text(tripDetails.tripDestination)
                    .frame(maxWidth: 100, maxHeight: 38)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 18.5)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundStyle(.gray.opacity(0.8))
                    )
                    .designSystemTypography(.tripDest, color: .gpWhite)
                    .foregroundColor(.white)
                    .padding([.top, .trailing], 18)
            }
            
            // Trip name
            VStack(alignment: .leading, spacing: 8) {
                
                // Trip Name
                Text(tripDetails.tripName)
                    .designSystemTypography(.tripNm, color: .gpBlack)
                HStack {
                    
                    // Trip Start Date
                    Text(tripDetails.tripStartDate)
                        .designSystemTypography(.tripSD, color: .gpBlack)
                    Spacer()
                    
                    // Trip Duration
                    Text(tripDetails.totalDays() ?? "N/A")
                        .designSystemTypography(.tripSD, color: .gpBlack)
                }
            }
            .padding(.bottom, 14)
            
            // Button
            NavigationLink {
                TripDetailInfoCardView(tripDetails: tripDetails)
            } label: {
                HStack {
                    Text("View")
                        .designSystemTypography(.tripSD, color: .gpWhite)
                        .frame(maxWidth: .infinity, maxHeight: 48)
                        .padding(13)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundStyle(.gpBlue)
                        )
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
    }
}

#Preview {
    TripDetailCard(
        tripDetails: TripDetail(id: 1, image: "https://placebear.com/400/600", tripName: "Bahamas Family Trip.", tripDestination: "Paris.", tripStartDate: "19th April 2024", tripEndDate: "24th May 2024", tripLocation: "New York, United States of America", tripType: "Solo Trip", flightInformation: FlightInformation(flightName: "American Airlines", flightNumber: "AA-829", flightTakeOffTime: "08:25", flightTakeOffDate: "Sun, 20 Aug", flightArrivalTime: "09:55",flightArrivalDate: "Sun, 20 Aug", flightType: "direct", takeOffCityCode: "LOS", arrivalCityCode: "SIN", flightCost: "123,456.00"), hotelInformation: HotelInformation(hotelImage: "https://placebear.com/700/700", hotelName: "Riviera Resort, Lekki", hotelRating: "8.5", hotelTotalReviews: "123", hotelAddress: "18, Kenneth Agbakuru Street, Off Access Bank Admiralty Way, Lekki Phase 1", roomType: "King size room", checkInDate: "20-04-2024", checkOutDate: "29-04-2024", hotelPrice: "123,456.00"), activityInformation: ActivityInformation(activityImage: "https://placebear.com/600/600", activityName: "The Museum of Modern Art", activityDescription: "Works from Van Gogh to Warhol & beyond plus a sculpture garden, 2 cafes & The modern restaurant", activityLocation: "Melbourne, Australia", activityDuration: "3 hours", checkOutDate: "10:30 AM on Mar 19", activityRating: "8.5", activityTotalReviews: "123", activityPrice: "123,456.00"))
    )
}
