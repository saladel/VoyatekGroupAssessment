//
//  CreateTripBottomSheet.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 19/10/2024.
//

import SwiftUI

struct CreateTripBottomSheet: View {
    @StateObject private var viewModel: CreateTripViewModel
    
    init(viewModel: CreateTripViewModel = CreateTripViewModel()) {
            _viewModel = StateObject(wrappedValue: viewModel)
        }
    
    @Environment (\.dismiss) var dismiss
    
    @FocusState var isTypingOnTripName: Bool
    @FocusState var isTypingOnTripDescription: Bool
    
    @State private var showAlert = false

    var body: some View {
        // custom bottomsheet
        VStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image(.profile)
                    
                    Spacer()
                    
                    Button(action: {dismiss()}, label: {
                        Image("xmark")
                    })
                    .padding(.trailing, 20)
                }
                .padding(.top, 8)
                .padding(.bottom, 16)
            }
            
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Create a Trip")
                            .designSystemTypography(.buttonTextWithBold)
                        
                        Text("Let's Go! Build Your Next Adventure")
                            .designSystemTypography(.tripDeetsBody, color: .whereto)
                        
                        
                    }
                    .padding(.bottom, 20)
                    
                    Spacer()
                }
                
                VStack(spacing: 10) {
                    // trip name
                    CreateTripForm(cfTitleText: "Trip Name", cfSubTitleText: "Enter the trip name", istypingTripDescription: false, userInputText: $viewModel.tripName)
                    
                    // Travel Style
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Travel Style")
                            .designSystemTypography(.tripSD, color: .gpBlack)
                        
                        DropdownMenu(
                            selectedOption: $viewModel.tripStyle, //.constant(nil),
                            placeholder: "Select your travel style",
                            options: DropdownMenuOption.tripTypes,
                            designSysTypSelection: .tripSD,
                            colorOfthicknessOfWidth: .dates,
                            doesThisRequirePadding: false,
                            textClr: .dates
                        )
                    }
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.bottom, 12)
                    
                    // Trip Description
                    CreateTripForm(cfTitleText: "Trip Description", cfSubTitleText: "Tell us more about the trip", heightOfTextField: 120, istypingTripDescription: true, userInputText: $viewModel.tripDescription)
                }
                
            }
            .scrollIndicators(.hidden)
            
            if viewModel.isLoading {
                HStack(spacing: 5) {
                    ProgressView()
                    Text("Creating your trip")
                }
                .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            
            if let error = viewModel.error {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }
            
            GPButton(
                textColor: .gpWhite,
                buttonText: "Create Trip",
                gpButtonAction: {
                    Task {
                        print("Calling createTrip")
                        await viewModel.createTrip()
                        print("createTrip completed")
                        self.showAlert = true
                    }
                },
                backgroundColorOfButton: viewModel.tripName.isEmpty || viewModel.tripStyle == nil || viewModel.tripDescription.isEmpty ? .gpBlue.opacity(0.6) : .gpBlue,
                designSysSelection: .blacked,
                heightOfButton: 38
            )
            .disabled(viewModel.tripName.isEmpty || viewModel.tripStyle == nil || viewModel.tripDescription.isEmpty)
            
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .alert(isPresented: $showAlert) {
            if let error = viewModel.error {
                Alert(
                    title: Text("Error"),
                    message: Text(error),
                    dismissButton: .default(Text("OK"))
                )
            } else {
                Alert(
                    title: Text(viewModel.currentToast?.message ?? ""),
                    message: Text(""),
                    dismissButton: .default(Text("OK"), action: {
                        viewModel.currentToast = nil
                        dismiss()
                    })
                )
            }
            
        }
    }
}

#Preview {
    CreateTripBottomSheet()
}
