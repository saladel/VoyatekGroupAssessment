//
//  GPButton.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 16/10/2024.
//

import SwiftUI

struct GPButton: View {
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
            HStack {
                Text(buttonText)
                    .designSystemTypography(designSysSelection, color: textColor)
                    .frame(maxWidth: .infinity, maxHeight: heightOfButton)
                    .padding(13)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundStyle(backgroundColorOfButton)
                    )
                
                if let iconToTheRightOfText = iconToTheRightOfText {
                    switch iconToTheRightOfText {
                    case .systemSymbol(let name):
                        Image(systemName: name ?? "")
                            .font(.system(size: 24, weight: .regular))
                            .foregroundColor(.black)
                        
                    case .asset(let name):
                        Image(name ?? "")
                            .font(.system(size: 24, weight: .regular))
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    GPButton(textColor: .gpWhite, buttonText: "Create a Trip", backgroundColorOfButton: .gpBlue, designSysSelection: .blacked)
}
