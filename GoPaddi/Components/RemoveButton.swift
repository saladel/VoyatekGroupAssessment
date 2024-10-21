//
//  RemoveButton.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 16/10/2024.
//

import SwiftUI

struct RemoveButton: View {
    var textColor: Color
    var buttonText: String
    var gpButtonAction: () -> Void = {}
    var backgroundColorOfButton: Color
    var designSysSelection: DesignSystem.Typography
    var heightOfButton: CGFloat = 48
    var iconToTheRightOfText: ImageType?
    
        enum ImageType {
            case systemSymbol(name: String?)
            case asset(name: String?)
        }
    
    var body: some View {
        Button(action: gpButtonAction) {
            HStack(spacing: 12.75) {
                Text(buttonText)
                    
                
                if let iconToTheRightOfText = iconToTheRightOfText {
                    switch iconToTheRightOfText {
                    case .systemSymbol(let name): 
                        Image(systemName: name ?? "")
                            .resizable()
                            .frame(width: 11, height: 11)
                        
                    case .asset(let name): Image(name ?? "")
                            .resizable()
                            .frame(width: 11, height: 11)
                    }
                }
                
            }
            .designSystemTypography(designSysSelection, color: textColor)
            .frame(maxWidth: .infinity, maxHeight: heightOfButton)
            //.frame(maxWidth: .infinity)
            .padding(.vertical, 24)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .foregroundStyle(backgroundColorOfButton)
            )
        }
    }
}


#Preview {
    RemoveButton(textColor: .buttonRed, buttonText: "Remove", backgroundColorOfButton: .btnRedBckgrnd, designSysSelection: .tripDetailNameHeader, heightOfButton: 70, iconToTheRightOfText: .systemSymbol(name: "xmark"))
}
