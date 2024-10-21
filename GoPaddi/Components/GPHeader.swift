//
//  GPHeader.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 10/10/2024.
//

import Foundation
import SwiftUI

struct GPHeader: View {
    var leftHeaderTitle: String?
    var leftAction: () -> Void = {}
    //var leftIcon: String?
    var leftIcon: ImageType?
    var firstRightIconAction: () -> Void = {}
    var firstRightIcon: ImageType?
    var withSpacingOf: CGFloat = 0
    var rightAction: () -> Void = {}
    //var rightIcon: String?
    var rightIcon: ImageType?
    var rightTitle: String?
    var headerTitle: String?
    var bottomPaddingRelatingToHeaderTitle: CGFloat? = 30
    var spacingBetweenLeftIconAndLeftHeaderTitle: CGFloat?
    
    @Environment(\.colorTheme) private var colorTheme: ColorTheme
    
    enum ImageType {
            case systemSymbol(name: String?)
            case asset(name: String?)
        }
    
    var body: some View {
        VStack{
            HStack{
                if let leftIcon = leftIcon {
                    Button(action: leftAction) {
                        ZStack {
                            switch leftIcon {
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
                
                Spacer(minLength: spacingBetweenLeftIconAndLeftHeaderTitle)
                
                if let leftHeaderTitle = leftHeaderTitle {
                    Text(leftHeaderTitle)
                        .designSystemTypography(.gpHeader)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer(minLength: 0)
                
                if let firstRightIcon = firstRightIcon {
                    Button(action: firstRightIconAction) {
                        ZStack {
                            switch firstRightIcon {
                            case .systemSymbol(let name):
                                Image(systemName: name ?? "")
                                    .font(.system(size: 24, weight: .regular))
                                    //.foregroundColor(colorTheme.black)
                                    .foregroundColor(.black)
                                
                            case .asset(let name):
                                Image(name ?? "")
                                    .font(.system(size: 24, weight: .regular))
                                    //.foregroundColor(colorTheme.black)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                
                if rightIcon != nil && firstRightIcon != nil {
                    Spacer().frame(width: withSpacingOf)
                }
                

                if let rightIcon = rightIcon  {
                    Button(action: rightAction){
                        ZStack {
                            switch rightIcon {
                            case .systemSymbol(let name):
                                Image(systemName: name ?? "")
                                    .font(.system(size: 24, weight: .regular))
                                    //.foregroundColor(colorTheme.black)
                                    .foregroundColor(.black)
                                
                            case .asset(let name):
                                Image(name ?? "")
                                    .font(.system(size: 24, weight: .regular))
                                    //.foregroundColor(colorTheme.black)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                
                if rightTitle != nil {
                    Button(action: rightAction) {
                        Text(rightTitle!)
                            .designSystemTypography(.gpHeader, color: colorTheme.gpBlack) //colorTheme.secondary)
                    }
                }
            }
            // this changes across various headers, the lowest I've seen is 19
            .padding(.bottom, bottomPaddingRelatingToHeaderTitle)
            
            if headerTitle != nil {
                VStack(alignment: .leading, spacing: 5){
                    Text(headerTitle!)
                        //.designSystemTypography(.h5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}


struct GPHeader_Previews: PreviewProvider {
    static var previews: some View {
        GPHeader(leftHeaderTitle: "Plan a Trip", leftIcon: .systemSymbol(name: "arrow.left"),  spacingBetweenLeftIconAndLeftHeaderTitle: 12)
        
        GPHeader(leftIcon: .systemSymbol(name: "arrow.left"), rightTitle: "Skip", headerTitle: "Bio")
        
        GPHeader(leftHeaderTitle:"Circu", firstRightIcon: .asset(name: "notification_bell") , withSpacingOf: 20, rightIcon: .systemSymbol(name:"slider.horizontal.3"))
        
        GPHeader(leftIcon: .systemSymbol(name: "arrow.left"), firstRightIcon: .systemSymbol(name: "magnifyingglass"), withSpacingOf: 20, rightIcon:.systemSymbol(name: "bell"), headerTitle: "Messages", bottomPaddingRelatingToHeaderTitle: 25)
    }
}

