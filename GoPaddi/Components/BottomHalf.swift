//
//  BottomHalf.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 16/10/2024.
//

import SwiftUI

struct BottomHalf: View {
    //let tripDetails: TripDetail
    var amount: String
    var firstText: String
    var priceText: String
    var editText: String
    var buttonActionHere: () -> Void
    
    var body: some View {
        VStack {
            Divider()
                .padding(.top, 10)
            
            HStack {
                FlightPriceEditDetailsButton(buttonTextDescription: firstText, flightPriceEditDetailsButtonAction: {print(firstText)})
                
                Spacer()
                
                FlightPriceEditDetailsButton(buttonTextDescription: priceText, flightPriceEditDetailsButtonAction: {print(priceText)})
                
                Spacer()
                
                FlightPriceEditDetailsButton(buttonTextDescription: editText, flightPriceEditDetailsButtonAction: {print(editText)})
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            
            Divider()
            
            // cost
            HStack(spacing: 2) {
                Image(systemName: "nairasign")
                
                Text(amount)
                    Spacer()
            }
            .designSystemTypography(.tripDetailNameHeader)
            .padding([.horizontal, .vertical])
            
            // Remove Button
            RemoveButton(textColor: .buttonRed, buttonText: "Remove", gpButtonAction: buttonActionHere, backgroundColorOfButton: .btnRedBckgrnd, designSysSelection: .tripDetailNameHeader, heightOfButton: 70, iconToTheRightOfText: .systemSymbol(name: "xmark"))
        }
    }
}

#Preview {
    BottomHalf(amount: "123,456.00", firstText: "Flight", priceText: "Price", editText: "Edit", buttonActionHere: {print("f")} )
}
