//
//  TripDetailInfoView.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 10/10/2024.
//

import SwiftUI

struct TripDetailInfoCardView: View {
    let tripDetails: TripDetail
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        GPHeader(leftHeaderTitle: "Plan a Trip", leftAction: {dismiss()}, leftIcon: .systemSymbol(name: "arrow.left"), spacingBetweenLeftIconAndLeftHeaderTitle: 12)
            .designSystemTypography(.gpHeader, color: .black)
            .padding(.top, 50)
            .frame(maxHeight: 50)
            .padding(.leading, 16)
            .padding(.bottom, 18)
        
        ScrollView {
            Image("palm")
                .padding(.bottom, 20)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Image("CalendarImage")
                    
                    Text(tripDetails.tripStartDate)
                    
                    Image("ArrowRight")
                    
                    Text(tripDetails.tripEndDate)
                }
                .padding(8)
                .background(.gpGray3)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .designSystemTypography(.tripDeetsBody, color: .gpBlack)
                
                
                Text(tripDetails.tripName)
                    .designSystemTypography(.tripDetailNameHeader)
                    .padding(.vertical, 4)
                
                
                Text("\(Text(tripDetails.tripLocation)) | \(Text(tripDetails.tripType))")
                    .designSystemTypography(.tripDeetsBody, color: .gpGray2)
                
                HStack(spacing: 12) {
                    Button(action: {
                        print("Collaboration")
                    }, label: {
                        HStack(spacing: 5) {
                            Image(.handshake)
                            Text("Trip Collaboration")
                        }
                        .foregroundStyle(.gpBlue)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 11)
                        .overlay(
                            Color.gpBlue, in: RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 1)
                        )
                    })
                    
                    Button(action: {
                        print("Share")
                    }, label: {
                        HStack(spacing: 5) {
                            Image(.handshake)
                            Text("Share Trip")
                        }
                        .foregroundStyle(.gpBlue)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 13)
                        .overlay(
                            Color.gpBlue, in: RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 1)
                        )
                    })
                    
                    Button(action: {
                        print("fcr")
                    }, label: {
                        Image(systemName: "ellipsis")
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.gpBlack)
                    })
                }
                .padding(.vertical, 16)
            }
            .padding(.horizontal, 16)
            
            VStack(spacing: 8) {
                ActivityHotelFlightCard(nameOfCard: "Activities", descriptionOfCard: "Build, personalize, and optimize your itineraries with our trip planner.", descriptionOfCardColor: .gpWhite, textOfButton: "Add Activities", backgroundColorOfCard: .gpDarkBlue, colorOfButton: .gpBlue, colorOfButtonText: .white)
                
                ActivityHotelFlightCard(nameOfCard: "Hotels", descriptionOfCard: "Build, personalize, and optimize your itineraries with our trip planner.", descriptionOfCardColor: .gpBlack, textOfButton: "Add Hotels", backgroundColorOfCard: .gpLightBlue, colorOfButton: .gpBlue, colorOfButtonText: .white)
                
                ActivityHotelFlightCard(nameOfCard: "Flights", descriptionOfCard: "Build, personalize, and optimize your itineraries with our trip planner.", descriptionOfCardColor: .gpWhite, textOfButton: "Add Flights", backgroundColorOfCard: .gpBlue, colorOfButton: .white, colorOfButtonText: .gpBlue)
                
            }
            .padding(.horizontal, 16)
             
            TripItinerariesTextCard(titleText: "Trip itineraries", subTitleText: "Your trip itineraries are placed here")
            
            
            // MARK: FLIGHTS
            if ((tripDetails.flightInformation?.flightName?.isEmpty) != nil)  {
                // MARK: FLIGHTS
                VStack(alignment: .leading) {
                    HStack(spacing: 10) {
                        Image("AirplaneInFlight")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.gpBlack)
                            .frame(width: 23, height: 20)
                        
                        Text("Flights")
                            .designSystemTypography(.tripDetailNameHeader, color: .gpBlack)
                    }
                    
                    VStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            HStack(alignment: .center, spacing: 12) {
                                Image("americanair")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                
                                VStack(alignment: .leading) {
                                    Text(tripDetails.flightInformation?.flightName ?? "")
                                        .designSystemTypography(.tripDetailNameHeader)
                                        .padding(.bottom, 2)
                                    
                                    Text(tripDetails.flightInformation?.flightNumber ?? "")
                                        .designSystemTypography(.tripSD, color: .gpGray2)
                                }
                            }
                            .padding(.bottom, 10)
                            
                            HStack(alignment: .center, spacing: 24) {
                                VStack(alignment: .trailing) {
                                    Text(tripDetails.flightInformation?.flightTakeOffTime ?? "")
                                        .designSystemTypography(.tripDetailNameHeader)
                                    
                                    Text(tripDetails.flightInformation?.flightTakeOffDate ?? "")
                                        .designSystemTypography(.tripDeetsBody, color: .gpGray2)
                                }
                                
                                VStack(alignment: .center, spacing: 13) {
                                    HStack(alignment: .center, spacing: 13.1) {
                                        Image("takeoff")
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                        
                                        Text(tripDetails.flightInformation?.flightDuration() ?? "")
                                            .designSystemTypography(.tripSD, color: .gpGray2)
                                            .padding(.horizontal, 1)
                                        
                                        Image("landing")
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                    }
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundStyle(.gpLightBlue)
                                            .frame(maxWidth: 120, maxHeight: 8)
                                        
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundStyle(.gpBlue)
                                            .frame(maxWidth: 62, maxHeight: 8)
                                    }
                                    
                                    HStack(alignment: .center) {
                                        Text(tripDetails.flightInformation?.takeOffCityCode ?? "")
                                            .designSystemTypography(.buttonTextWithBold)
                                        
                                        Text(tripDetails.flightInformation?.flightType ?? "")
                                            .designSystemTypography(.tripSD, color: .gpGray2)
                                        
                                        Text(tripDetails.flightInformation?.arrivalCityCode ?? "")
                                            .designSystemTypography(.buttonTextWithBold)
                                    }
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(tripDetails.flightInformation?.flightArrivalTime ?? "")
                                        .designSystemTypography(.tripDetailNameHeader)
                                    
                                    Text(tripDetails.flightInformation?.flightArrivalDate ?? "")
                                        .designSystemTypography(.tripDeetsBody, color: .gpGray2)
                                }
                                
                            }
                        }
                        .padding(.horizontal)
                        
                        
                        
                        Divider()
                            .padding(.top, 10)
                        
                        HStack {
                            FlightPriceEditDetailsButton(buttonTextDescription: "Flight", flightPriceEditDetailsButtonAction: {print("flight")})
                            
                            Spacer()
                            
                            FlightPriceEditDetailsButton(buttonTextDescription: "Price", flightPriceEditDetailsButtonAction: {print("Price")})
                            
                            Spacer()
                            
                            FlightPriceEditDetailsButton(buttonTextDescription: "Edit", flightPriceEditDetailsButtonAction: {print("Edit")})
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        
                        Divider()
                        
                        // cost
                        HStack(spacing: 2) {
                            Image(systemName: "nairasign")
                            Text(tripDetails.flightInformation?.flightCost ?? "")
                                Spacer()
                        }
                        .designSystemTypography(.tripDetailNameHeader)
                        .padding([.horizontal, .vertical])
                        
                        // Remove Button
                        RemoveButton(textColor: .buttonRed, buttonText: "Remove", gpButtonAction: {print("Flight Removed")}, backgroundColorOfButton: .btnRedBckgrnd, designSysSelection: .tripDetailNameHeader, heightOfButton: 70, iconToTheRightOfText: .systemSymbol(name: "xmark"))
                        
                    }
                    .padding(.top, 20)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                .padding()
                .background(.backgrndGray)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .padding(.horizontal)
                .padding(.bottom)
            } else {
                EmptyTripItinerariesCard(displayPicture: "AirplaneInFlight", displayPictureColor: .gpBlack, textToTheRightOfDisplayPicture: "Flights", textToTheRightOfDisplayPictureColor: .gpBlack, middlePicture: "planeImage", middleText: "No request yet", buttonTextUnderMiddleText: "Add Flight", backgroundCardColor: .backgrndGray)
            }
            
            // MARK: HOTELS
            if ((tripDetails.hotelInformation?.hotelName?.isEmpty) != nil)  {
                // MARK: HOTELS
                VStack(alignment: .leading) {
                    HStack(spacing: 10) {
                        Image("hotelIcon")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.gpWhite)
                            .frame(width: 23, height: 20)
                        
                        Text("Hotels")
                            .designSystemTypography(.tripDetailNameHeader, color: .gpWhite)
                    }
                    
                    VStack {
                        VStack {
                 ZStack(alignment: .centerLastTextBaseline) {
                 Image("rec")
                     .padding(.bottom)
                     
                     
                     HStack {
                         Image("lft")
                         Spacer()
                         Image("rght")
                     }
                     .frame(width: 115, height: 10)
                     .padding(.vertical)
                     .padding(.horizontal, 10)
                     .background(.gray.opacity(0.3))
                     .brightness(0.17)
                     .clipShape(RoundedRectangle(cornerRadius: 4))
                     .padding(.bottom, 35)
                 }
                            
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text(tripDetails.hotelInformation?.hotelName ?? "")
                                    .designSystemTypography(.tripDetailNameHeader)
                                
                                Text(tripDetails.hotelInformation?.hotelAddress ?? "")
                                    .designSystemTypography(.tripSD)
                                    .padding(.bottom, 6)
                                
                                HStack(spacing: 7) {
                                    HStack(alignment: .center, spacing: 2) {
                                        Image("MapPin")
                                            .resizable()
                                            .frame(width: 14, height: 14)
                                        
                                        
                                        Button {
                                            print("Show in map")
                                        } label: {
                                            Text("Show in map")
                                        }
                                        
                                    }
                                    .designSystemTypography(.buttonTextWithBold, color: .gpBlue)
                                    
                                    HStack (spacing: 2){
                                        Image(systemName: "star.fill")
                                            .resizable()
                                            .frame(width: 14, height: 14)
                                            .foregroundStyle(.star)
                                        
                                        HStack(spacing: 3){
                                            Text(tripDetails.hotelInformation?.hotelRating ?? "")
                                            
                                            Text("(\(tripDetails.hotelInformation?.hotelTotalReviews ?? ""))")
                                        }
                                        .designSystemTypography(.tripSD, color: .gpGray2)
                                        
                                    }
                                    
                                    HStack(spacing: 4) {
                                        Image("bed")
                                            .resizable()
                                            .frame(width: 15, height: 11)
                                        
                                        Text(tripDetails.hotelInformation?.roomType ?? "")
                                            .designSystemTypography(.tripSD, color: .gpGray2)
                                    }
                                }
                            }
                        }
                        .padding([.top, .horizontal], 16)
                        .padding(.bottom, 5)
                        
                        Divider()
                        
                        HStack(alignment: .center, spacing: 12) {
                            HStack(spacing: 4) {
                                Image("CalendarBlank")
                                    .foregroundStyle(.cal)
                                
                                Text("In:")
                                
                                Text(tripDetails.hotelInformation?.checkInDate ?? "")
                            }
                            
                            HStack(spacing: 4) {
                                Image("CalendarBlank")
                                    .foregroundStyle(.cal)
                                
                                Text("Out:")
                                
                                Text(tripDetails.hotelInformation?.checkOutDate ?? "")
                            }
                        }
                        .designSystemTypography(.tripSD, color: .gpGray2)
                        .padding(.top, 10)
                        
                        BottomHalf(amount: tripDetails.hotelInformation?.hotelPrice ?? "", firstText: "Hotel", priceText: "Price", editText: "Edit", buttonActionHere: {print("Hotel Removed")} )
                        
                    }
                    //.padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                   
                }
                .padding()
                .background(.gpGray1)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .padding(.horizontal)
                .padding(.bottom)
            } else {
                EmptyTripItinerariesCard(displayPicture: "hotelIcon", displayPictureColor: .gpWhite, textToTheRightOfDisplayPicture: "Hotels", textToTheRightOfDisplayPictureColor: .gpWhite, middlePicture: "hotelImage", middleText: "No request yet", buttonTextUnderMiddleText: "Add Hotels", backgroundCardColor: .gpGray1)
            }
            
            // MARK: ACTIVITIES
            if ((tripDetails.activityInformation?.activityName?.isEmpty) != nil)  {
                // MARK: ACTIVITIES
                VStack(alignment: .leading) {
                    HStack(spacing: 10) {
                        Image("RoadHorizon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 23, height: 20)
                        
                        Text("Activities")
                    }
                    .designSystemTypography(.tripDetailNameHeader, color: .gpWhite)
                    
                    VStack {
                        VStack {
                            ZStack(alignment: .centerLastTextBaseline) {
                                Image("mus")
                                    .padding(.bottom)
                                
                                
                                HStack {
                                    Image("lft")
                                    Spacer()
                                    Image("rght")
                                }
                                .frame(width: 115, height: 10)
                                .padding(.vertical)
                                .padding(.horizontal, 10)
                                .background(.gray.opacity(0.3))
                                .brightness(0.17)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                                .padding(.bottom, 35)
                            }
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text(tripDetails.activityInformation?.activityName ?? "")
                                    .designSystemTypography(.tripDetailNameHeader)
                                
                                Text(tripDetails.activityInformation?.activityDescription ?? "")
                                    .designSystemTypography(.tripSD, color: .gpBlack)
                                    .padding(.bottom, 6)
                                
                                HStack {
                                    HStack(alignment: .center, spacing: 2) {
                                        Image("MapPin")
                                            .resizable()
                                            .frame(width: 14, height: 14)
                                        
                                        Text(tripDetails.activityInformation?.activityLocation ?? "")
                                            .lineLimit(1)
                                    }
                                    .designSystemTypography(.buttonTextWithBold, color: .gpBlue)
                                    
                                    
                                    HStack (spacing: 2){
                                        Image(systemName: "star.fill")
                                            .resizable()
                                            .frame(width: 14, height: 14)
                                            .foregroundStyle(.star)
                                        
                                        HStack(spacing: 3){
                                            Text(tripDetails.activityInformation?.activityRating ?? "")
                                            
                                            Text("(\(tripDetails.activityInformation?.activityTotalReviews ?? ""))")
                                        }
                                        .designSystemTypography(.tripSD, color: .gpGray2)
                                        
                                    }
                                    
                                    HStack(spacing: 4) {
                                        Image("bed")
                                            .resizable()
                                            .frame(width: 15, height: 11)
                                        
                                        Text(tripDetails.activityInformation?.activityDuration ?? "")
                                            .designSystemTypography(.tripSD, color: .gpGray2)
                                    }
                                }
                            }
                        }
                        .padding([.top, .horizontal], 16)
                        .padding(.bottom, 5)
                        
                        Divider()
                        
                        HStack(alignment: .center, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                Button {
                                    print("time changed")
                                } label: {
                                    Text("Change time")
                                        .underline()
                                        .designSystemTypography(.changeTime, color: .gpBlue)
                                }

                                Text("10:30 AM on Mar 19")
                                    .designSystemTypography(.tripDeetsBody, color: .gpBlack)
                            }
                            
                            Spacer()
                            
                            Text("Day 1 (Activity 1)")
                                .designSystemTypography(.tripDeetsBody, color: .gpBlack)
                                .padding(8)
                                .background(.backgrndGray)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        }
                       // .designSystemTypography(.tripSD, color: .gpGray2)
                        .padding(.top, 10)
                        .padding(.horizontal)
                        
                        BottomHalf(amount: tripDetails.activityInformation?.activityPrice ?? "", firstText: "Hotel", priceText: "Price", editText: "Edit", buttonActionHere: {print("Activity Removed")} )
                        
                    }
                    //.padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                   
                }
                .padding()
                .background(.gpBlue)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .padding(.horizontal)
                .padding(.bottom)
            } else {
                EmptyTripItinerariesCard(displayPicture: "RoadHorizon", displayPictureColor: .gpWhite, textToTheRightOfDisplayPicture: "Activities",textToTheRightOfDisplayPictureColor: .gpWhite, middlePicture: "activitiesIcon", middleText: "No request yet", buttonTextUnderMiddleText: "Add Flight", backgroundCardColor: .gpBlue)
            }
        }
        .scrollIndicators(.hidden)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TripDetailInfoCardView(
        tripDetails: TripDetail(id: 1, image: "https://placebear.com/400/600", tripName: "Bahamas Family Trip.", tripDestination: "Paris.", tripStartDate: "19th April 2024", tripEndDate: "24th May 2024", tripLocation: "New York, United States of America", tripType: "Solo Trip", flightInformation: FlightInformation(flightName: "American Airlines", flightNumber: "AA-829", flightTakeOffTime: "08:25", flightTakeOffDate: "Sun, 20 Aug", flightArrivalTime: "09:55",flightArrivalDate: "Sun, 20 Aug", flightType: "Direct", takeOffCityCode: "LOS", arrivalCityCode: "SIN", flightCost: "123,456.00"), hotelInformation: HotelInformation(hotelImage: "https://placebear.com/700/700", hotelName: "Riviera Resort, Lekki", hotelRating: "8.5", hotelTotalReviews: "123", hotelAddress: "18, Kenneth Agbakuru Street, Off Access Bank Admiralty Way, Lekki Phase 1", roomType: "King size room", checkInDate: "20-04-2024", checkOutDate: "29-04-2024", hotelPrice: "123,456.00"), activityInformation: ActivityInformation(activityImage: "https://placebear.com/600/600", activityName: "The Museum of Modern Art", activityDescription: "Works from Van Gogh to Warhol & beyond plus a sculpture garden, 2 cafes & The modern restaurant", activityLocation: "Melbourne, Australia", activityDuration: "3 hours", checkOutDate: "10:30 AM on Mar 19", activityRating: "8.5", activityTotalReviews: "123", activityPrice: "123,456.00") )
    )
}


struct ActivityHotelFlightCard: View {
    var nameOfCard: String
    var descriptionOfCard: String
    var descriptionOfCardColor: Color
    var textOfButton: String
    var backgroundColorOfCard: Color
    var colorOfButton: Color
    var colorOfButtonText: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(nameOfCard)
                .designSystemTypography(.tripDetailNameHeader, color: descriptionOfCardColor)
            
            Text(descriptionOfCard)
                .designSystemTypography(.regularText, color: descriptionOfCardColor)
                .padding(.bottom, 37)
            
            GPButton(textColor: colorOfButtonText, buttonText: textOfButton, backgroundColorOfButton: colorOfButton, designSysSelection: .tripSD)
        }
        .padding()
        .background(backgroundColorOfCard)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}


struct FlightPriceEditDetailsButton: View {
    var buttonTextDescription: String
    var flightPriceEditDetailsButtonAction: () -> Void
    
    var body: some View {
        Button {
            flightPriceEditDetailsButtonAction()
        } label: {
            Text("\(buttonTextDescription) Details")
                .designSystemTypography(.buttonTextWithBold, color: .gpBlue)
        }
    }
}
