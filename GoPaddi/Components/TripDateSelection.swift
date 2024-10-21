//
//  TripDateSelection.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 17/10/2024.
//

import SwiftUI

struct TripDateSelection: View {
    let title: String
    @Binding var date: Date
    @Binding var showPicker: Bool
    let dateFormatter: DateFormatter
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .designSystemTypography(.tripDeetsBody, color: .gpBlack)

            Button(action: {
                showPicker.toggle()
            }) {
                HStack {
                    Text(dateFormatter.string(from: date))
                        .designSystemTypography(.tripSD, color: .gpBlack)
                    
                    Spacer()
                    
                    Image("CalendarImage")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 4)
                      .fill(Color.white)
                  )
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                        .stroke(.dates, lineWidth: 1)
                )
            }
        }
    }
}

//#Preview {
//    TripDateSelection(title: "Start Date", date: $startDate, showPicker: $showingStartPicker, dateFormatter: dateFormatter)
//}
