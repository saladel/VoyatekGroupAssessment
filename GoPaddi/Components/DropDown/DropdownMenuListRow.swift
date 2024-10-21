//
//  DropdownMenuListRow.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 12/10/2024.
//

import SwiftUI

struct DropdownMenuListRow: View {
    let option: DropdownMenuOption
    
    /// An action called when user select an action.
    let onSelectedAction: (_ option: DropdownMenuOption) -> Void
    
    var body: some View {
        Button(action: {
            print("Selected option: \(option.option)")
            self.onSelectedAction(option)
        }) {
            Text(option.option)
                .designSystemTypography(.tripSD, color: .gpBlack)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.black)
        .padding(.vertical, 5)
        .padding(.horizontal)
         
//        Button(action: {
//            print("Selected option: \(option.option)")
//            self.onSelectedAction(option)
//        }) {
//            if self.onSelectedAction(option) == option.option {
//                HStack{
//                    Text(option.option)
//                        .designSystemTypography(.tripSD, color: .gpWhite)
//                    Spacer()
//                    Image(systemName: "checkmark")
//                        .foregroundStyle(.white)
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.horizontal, 10)
//                .padding(.vertical, 8)
//                .background(.gpBlue)
//                .clipShape(RoundedRectangle(cornerRadius: 4))
//            } else {
//                Text(option.option)
//                    .designSystemTypography(.tripSD, color: .gpBlack)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }
//        }
//        .foregroundColor(.black)
//        .padding(.vertical, 5)
//        .padding(.horizontal)
        
    }
}

struct DropdownMenuListRow_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuListRow(option: DropdownMenuOption.testSingleMonth, onSelectedAction: { _ in })
    }
}
