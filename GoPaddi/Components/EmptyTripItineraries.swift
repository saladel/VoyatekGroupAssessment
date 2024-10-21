//
//  EmptyTripItineraries.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 16/10/2024.
//

import SwiftUI

struct EmptyTripItineraries: View {
    var displayPicture: String
    var displayPictureColor: Color
    var textToTheRightOfDisplayPicture: String
    var textToTheRightOfDisplayPictureColor: Color
    var middlePicture: String
    var middleText: String
    var buttonTextUnderMiddleText: String
    var backgroundCardColor: Color
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ActivityHotelFlightCard(nameOfCard: "Activities", descriptionOfCard: "Build, personalize, and optimize your itineraries with our trip planner.", descriptionOfCardColor: .gpWhite, textOfButton: "Add Activities", backgroundColorOfCard: .gpDarkBlue, colorOfButton: .gpBlue, colorOfButtonText: .white)
                
                ActivityHotelFlightCard(nameOfCard: "Hotels", descriptionOfCard: "Build, personalize, and optimize your itineraries with our trip planner.", descriptionOfCardColor: .gpBlack, textOfButton: "Add Hotels", backgroundColorOfCard: .gpLightBlue, colorOfButton: .gpBlue, colorOfButtonText: .white)
                
                ActivityHotelFlightCard(nameOfCard: "Flights", descriptionOfCard: "Build, personalize, and optimize your itineraries with our trip planner.", descriptionOfCardColor: .gpWhite, textOfButton: "Add Flights", backgroundColorOfCard: .gpBlue, colorOfButton: .white, colorOfButtonText: .gpBlue)
            }
            .padding(.horizontal, 16)
            
            TripItinerariesTextCard(titleText: "Trip itineraries", subTitleText: "Your trip itineraries are placed here")
            
            VStack(spacing: 16) {
                EmptyTripItinerariesCard(displayPicture: "AirplaneInFlight", displayPictureColor: .gpBlack, textToTheRightOfDisplayPicture: "Flights", textToTheRightOfDisplayPictureColor: .gpBlack, middlePicture: "planeImage", middleText: "No request yet", buttonTextUnderMiddleText: "Add Flight", backgroundCardColor: .backgrndGray)
                
                EmptyTripItinerariesCard(displayPicture: "hotelIcon", displayPictureColor: .gpWhite, textToTheRightOfDisplayPicture: "Hotels", textToTheRightOfDisplayPictureColor: .gpWhite, middlePicture: "hotelImage", middleText: "No request yet", buttonTextUnderMiddleText: "Add Hotels", backgroundCardColor: .gpGray1)
                
                EmptyTripItinerariesCard(displayPicture: "RoadHorizon", displayPictureColor: .gpWhite, textToTheRightOfDisplayPicture: "Activities",textToTheRightOfDisplayPictureColor: .gpWhite, middlePicture: "activitiesIcon", middleText: "No request yet", buttonTextUnderMiddleText: "Add Flight", backgroundCardColor: .gpBlue)
            }
        }
        .scrollIndicators(.hidden)
    }
}


struct EmptyTripItineraries_Previews: PreviewProvider {
    static var previews: some View {
        
        EmptyTripItineraries(displayPicture: "AirplaneInFlight", displayPictureColor: .gpBlack, textToTheRightOfDisplayPicture: "Flights", textToTheRightOfDisplayPictureColor: .gpBlack, middlePicture: "planeImage", middleText: "No request yet", buttonTextUnderMiddleText: "Add Flight", backgroundCardColor: .backgrndGray)
        
        EmptyTripItinerariesCard(displayPicture: "AirplaneInFlight", displayPictureColor: .gpBlack, textToTheRightOfDisplayPicture: "Flights", textToTheRightOfDisplayPictureColor: .gpBlack, middlePicture: "planeImage", middleText: "No request yet", buttonTextUnderMiddleText: "Add Flight", backgroundCardColor: .backgrndGray)
        
        EmptyTripItinerariesCard(displayPicture: "hotelIcon", displayPictureColor: .gpWhite, textToTheRightOfDisplayPicture: "Hotels", textToTheRightOfDisplayPictureColor: .gpWhite, middlePicture: "hotelImage", middleText: "No request yet", buttonTextUnderMiddleText: "Add Hotels", backgroundCardColor: .gpGray1)
        
        EmptyTripItinerariesCard(displayPicture: "RoadHorizon", displayPictureColor: .gpWhite, textToTheRightOfDisplayPicture: "Activities",textToTheRightOfDisplayPictureColor: .gpWhite, middlePicture: "activitiesIcon", middleText: "No request yet", buttonTextUnderMiddleText: "Add Flight", backgroundCardColor: .gpBlue)
    }
}


struct EmptyTripItinerariesCard: View {
    var displayPicture: String
    var displayPictureColor: Color
    var textToTheRightOfDisplayPicture: String
    var textToTheRightOfDisplayPictureColor: Color
    var middlePicture: String
    var middleText: String
    var buttonTextUnderMiddleText: String
    var backgroundCardColor: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Image(displayPicture)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(displayPictureColor)
                    .frame(width: 23, height: 20)
                    
                Text(textToTheRightOfDisplayPicture)
                    .designSystemTypography(.tripDetailNameHeader, color: textToTheRightOfDisplayPictureColor)
            }
            .padding(.vertical)
            
            VStack(alignment: .center) {
                Image(middlePicture)
                    .padding(.bottom, 8)
                    .padding(.top, 53)
                
                Text(middleText)
                    .designSystemTypography(.tripDetailNameHeader)
                    .padding(.bottom, 12)
                
                GPButton(textColor: .gpWhite, buttonText: buttonTextUnderMiddleText, backgroundColorOfButton: .gpBlue, designSysSelection: .buttonTextWithBold)
                    .padding(.bottom, 63)
            }
            .padding(.horizontal,33)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        .padding()
        .background(backgroundCardColor)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .padding(.horizontal)
        //.padding(.bottom)
    }
}
        

//#Preview {
//    EmptyTripItineraries(displayPicture: "AirplaneInFlight", textToTheRightOfDisplayPicture: "Flights", middlePicture: "planeImage", middleText: "No request yet", buttonTextUnderMiddleText: "Add Flight")
//}

struct TripItinerariesTextCard: View {
    var titleText: String
    var subTitleText: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(titleText)
                    .designSystemTypography(.tripDetailNameHeader)
                
                Text(subTitleText)
                    .designSystemTypography(.tripDeetsBody, color: .gpGray2)
            }
            .padding(.horizontal, 16)
            .padding(.top, 10)
            .padding(.bottom, 16)
            
            Spacer()
        }
    }
}


