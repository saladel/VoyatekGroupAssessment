//
//  StartView.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 10/10/2024.
//

import SwiftUI

struct HomeView: View {
    @Environment (\.dismiss) var dismiss
    
    @State private var isShowingBottomSheet = false
    
    var body: some View {
        NavigationStack {
            GPHeader(leftHeaderTitle: "Plan a Trip", leftIcon: .systemSymbol(name: "arrow.left"), spacingBetweenLeftIconAndLeftHeaderTitle: 12)
                .designSystemTypography(.gpHeader, color: .black)
                .padding(.top, 50)
                //.frame(maxHeight: 20)
                .frame(maxHeight: 50)
                .padding(.leading, 16)
                .padding(.bottom, 18)
            
            ScrollView {
                
                ZStack(alignment: .topLeading) {
                    // background image
                    Image("body")
                        .resizable()
                        .scaledToFit()
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Plan Your Dream Trip in Minutes")
                            .designSystemTypography(.gpHeader, color: .gpBlack)
                        
                        Text("Build, personalize, and optimize your itineraries with our trip planner. Perfect for getaways, remote workcations, and any spontaneous escapade.")
                            .designSystemTypography(.tripSD, color: .gpGray2)
                            .lineSpacing(4)
                            .padding(.top, 8)
                        
                        VStack {
                            // Where To
                            GPWhereTo()
                            
                            // Start-End Date
                            HStack {
                                // StartDate
                                GPTripCalendarStartDate()
                                
                                // End Date
                                GPTripCalendarEndDate()
                            }
                            
                            GPButton(textColor: .gpWhite, buttonText: "Create a Trip", gpButtonAction: {
                                isShowingBottomSheet.toggle()
                            }, backgroundColorOfButton: .gpBlue, designSysSelection: .blacked)
                            .sheet(isPresented: $isShowingBottomSheet, content: {
                                CreateTripBottomSheet()
                                    .presentationDetents([.fraction(0.84)])
                                    .presentationCornerRadius(4)
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight:300)
                        .background(.white)
                        .cornerRadius(4)
                        .padding(.vertical, 26)
                        .padding(.horizontal ,12.5)
                        .padding(.top, 90)
                    }
                    .padding(.top, 23)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                TripItinerariesTextCard(titleText: "Your Trips", subTitleText: "Your trip itineraries and  planned trips are placed here")
                    .padding(.top, 14)
                
                    DropdownMenu(
                        selectedOption: .constant(nil),
                        placeholder: "Planned Trips",
                        options: DropdownMenuOption.tripOptions,
                        designSysTypSelection: .buttonTextWithBold,
                        thicknessOfWidth: 8,
                        colorOfthicknessOfWidth: .backgrndGray, doesThisRequirePadding: true, textClr: .gpBlack
                    )
                    .padding(.bottom, 24)
                
                TripDetailListView()
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    HomeView()
}

struct GPWhereTo: View {
    var body: some View {
        HStack{
            NavigationLink {
                CitySearchView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack(spacing: 12) {
                    Image("MapPin")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 14, height:   17)
                        .foregroundStyle(.mappin)
                    
                    VStack(alignment:.leading){
                        Text("Where to ?")
                            .designSystemTypography(.tripDeetsBody, color: .whereto)
                        Text("Select City")
                            .designSystemTypography(.blacked, color: .whereto)
                    }
                }
                .padding(.horizontal, 13)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight:86)
            .background(.wheretofill)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gpWhite, lineWidth: 1)
            )
        }
    }
}

struct GPTripCalendarStartDate: View {
    var body: some View {
        HStack {
            
            NavigationLink {
                TripCalendarView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack(spacing: 12){
                    Image("CalendarBlank")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 14, height:   17)
                        .foregroundStyle(.mappin)
                    
                    VStack(alignment:.leading){
                        Text("Start Date")
                            .designSystemTypography(.tripDeetsBody, color: .whereto)
                        Text("Enter Date")
                            .designSystemTypography(.blacked, color: .whereto)
                    }
                }
            }
            .padding(.horizontal, 13)
    
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight:82)
        .background(.wheretofill)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gpWhite, lineWidth: 1)
        )
    }
}

struct GPTripCalendarEndDate: View {
    var body: some View {
        HStack {
            
            NavigationLink {
                TripCalendarView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack(spacing: 12){
                    Image("CalendarBlank")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 14, height:   17)
                        .foregroundStyle(.mappin)
                    
                    VStack(alignment:.leading){
                        Text("End Date")
                            .designSystemTypography(.tripDeetsBody, color: .whereto)
                        Text("Enter Date")
                            .designSystemTypography(.blacked, color: .whereto)
                    }
                }
            }
            .padding(.horizontal, 13)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight:82)
        .background(.wheretofill)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gpWhite, lineWidth: 1)
        )
    }
}

struct CreateTripForm: View {
    var cfTitleText: String
    var cfSubTitleText: String
    var heightOfTextField: CGFloat? = 50
    var istypingTripDescription: Bool
    @Binding var userInputText: String
    @FocusState private var isTypingOnFormTextField: Bool
    
    var body: some View {
        VStack(alignment:.leading){
            Text(cfTitleText)
                .designSystemTypography(.tripSD, color: .gpBlack)
            
            if istypingTripDescription {
                TextEditor(text: $userInputText)
                    .frame(height: heightOfTextField)
                    .keyboardType(.default)
                    .submitLabel(.done)
                    .designSystemTypography(.tripSD, color: .gpBlack)
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.white)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .stroke(isTypingOnFormTextField ? Color.gpBlue : Color.dates, lineWidth: 1)
                    )
                    .focused($isTypingOnFormTextField)
                
            } else {
                TextField(cfSubTitleText, text: $userInputText)
                    .frame(height: heightOfTextField)
                    .designSystemTypography(.tripSD, color: .gpBlack)
                    .keyboardType(.default)
                    .autocorrectionDisabled()
                    .submitLabel(.done)
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.white)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .stroke(isTypingOnFormTextField ? Color.gpBlue : Color.dates, lineWidth: 1)
                            .focused($isTypingOnFormTextField)
                    )
                    .focused($isTypingOnFormTextField)
            }
        }
        .frame(alignment: .leading)
        .padding(.bottom, 12)
    }
}
