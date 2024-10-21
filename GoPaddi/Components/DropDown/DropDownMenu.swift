//
//  DropDownMenu.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 11/10/2024.
//

import SwiftUI

struct DropdownMenu: View {
    @Environment(\.colorTheme) private var colorTheme: ColorTheme
    
    /// Used to show or hide drop-down menu options
    @State private var isOptionsPresented: Bool = false
    
    /// Used to bind user selection
    @Binding var selectedOption: DropdownMenuOption?
    
    /// A placeholder for drop-down menu
    let placeholder: String
    
    /// The drop-down menu options
    let options: [DropdownMenuOption]
    
    var designSysTypSelection: DesignSystem.Typography
    
    var thicknessOfWidth: CGFloat = 1
    
    var colorOfthicknessOfWidth: Color = .gpGray2
    
    var doesThisRequirePadding: Bool
    
    var textClr: Color = .gpGray2
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.isOptionsPresented.toggle()
            }
        }) {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption!.option)
                    .designSystemTypography(designSysTypSelection, color: selectedOption == nil ? textClr : .gpBlack)
                    //.foregroundColor(selectedOption == nil ? colorTheme.gpGray2.opacity(0.5) : textClr)
                
                Spacer()
                
                Image(systemName: self.isOptionsPresented ? "chevron.up" : "chevron.down")
                // This modifier available for Image since iOS 16.0
                    .fontWeight(.medium)
                    .foregroundColor(.black)
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 4)
                .stroke(colorOfthicknessOfWidth, lineWidth: thicknessOfWidth)
        }
        .overlay(alignment: .top) {
            VStack {
                if self.isOptionsPresented {
                    Spacer(minLength: 60)
                    DropdownMenuList(options: self.options) { option in
                        self.isOptionsPresented = false
                        self.selectedOption = option
                    }
                }
            }
        }
        .padding(.horizontal, doesThisRequirePadding ? 16 : 0)
        // We need to push views under drop down menu down, when options list is
        // open
        .padding(
            // Check if options list is open or not
            .bottom, self.isOptionsPresented
            // If options list is open, then check if options size is greater
            // than 300 (MAX HEIGHT - CONSTANT), or not
            ? CGFloat(self.options.count * 32) > 300
                // IF true, then set padding to max height 300 points
                ? 300 + 30 // max height + more padding to set space between borders and text
                // IF false, then calculate options size and set padding
                : CGFloat(self.options.count * 32) + 10 //30
            // If option list is closed, then don't set any padding.
            : 0
        )
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu(
            selectedOption: .constant(nil),
            placeholder: "Select your birth month",
            options: DropdownMenuOption.testAllMonths, 
            designSysTypSelection: .blacked,
            doesThisRequirePadding: true
        )
    }
}
