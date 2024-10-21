//
//  CalendarView.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 12/10/2024.
//

import SwiftUI

struct TripCalendarView: View {
    @StateObject private var viewModel: CreateTripViewModel
    
    init(viewModel: CreateTripViewModel = CreateTripViewModel()) {
            _viewModel = StateObject(wrappedValue: viewModel)
        }
    
    @State private var isShowingTripStartDatePicker = false
    @State private var isShowingTripEndDatePicker = false
    
    @Environment (\.dismiss) var dismiss

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM d"
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            GPHeader(leftHeaderTitle: "Date", leftAction: {dismiss()}, leftIcon: .asset(name: "xmark"),  bottomPaddingRelatingToHeaderTitle: 0, spacingBetweenLeftIconAndLeftHeaderTitle: 18)
                .padding(.top, 30)
                //.frame(maxHeight: 20)
                .frame(maxHeight: 40)
                .padding(.leading, 16)
                .padding(.bottom, 10)
            
            VStack(spacing: 20) {
                ScrollView{
                    DatePicker("", selection: $viewModel.startDate, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .frame(maxHeight: 400)
                    DatePicker("", selection: $viewModel.endDate, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .frame(maxHeight: 400)
                }
                .scrollIndicators(.hidden)
                
                HStack {
                    TripDateSelection(title: "Start Date", date: $viewModel.startDate, showPicker: $isShowingTripStartDatePicker, dateFormatter: dateFormatter)
                    
                    TripDateSelection(title: "End Date", date: $viewModel.endDate, showPicker: $isShowingTripEndDatePicker, dateFormatter: dateFormatter)
                }
                
                // Button
                GPButton(
                    textColor: .gpWhite,
                    buttonText: "Choose Date",
                    gpButtonAction: {
                        print("Start Date: \(dateFormatter.string(from: viewModel.startDate))")
                        print("End Date: \(dateFormatter.string(from: viewModel.endDate))")
                        dismiss()
                    },
                    backgroundColorOfButton: .gpBlue,
                    designSysSelection: .buttonTextWithBold,
                    heightOfButton: 32
                )
            }
            .padding()
        }
    }
}


#Preview {
  TripCalendarView()
}
