//
//  ColorTheme.swift
//  iosApp
//
//  Created by Adewale Sanusi on 10/10/2024.
//

import Foundation
import SwiftUI

public struct DesignSystem {
    public enum Style {
        case gpWhite, gpLightBlue, gpBlue, gpBlack, gpGray1, gpGray2, gpDarkBlue
        
        func color(_ theme: ColorTheme) -> Color {
            switch self {
            case .gpWhite: return theme.gpWhite
            case .gpLightBlue: return theme.gpLightBlue
            case .gpBlue: return theme.gpBlue
            case .gpBlack: return theme.gpBlack
            case .gpGray1: return theme.gpGray1
            case .gpGray2: return theme.gpGray2
            case .gpDarkBlue: return theme.gpDarkBlue
            }
        }
    }
    
    /*
     "tripName": "Bahamas Family Trip.",
         "tripDestination": "Paris.",
         "tripStartDate": "19th April 2024",
         "tripEndDate": "24th May 2024"
     */
    public enum Typography {
        case tripDest, tripNm, tripSD, tripED, gpHeader, tripDetailNameHeader, tripDeetsBody, regularText, buttonTextWithBold, changeTime, blacked, placeHolderSearchText
        
        var size: CGFloat {
            switch self {
            case .tripDest: return 14
            case .tripNm: return 16
            case .tripSD: return 14
            case .tripED: return 14
            case .gpHeader: return 18
            case .tripDetailNameHeader: return 16
            case .tripDeetsBody: return 12
            case .regularText: return 12
            case .buttonTextWithBold: return 14
            case .changeTime: return 12
            case .blacked: return 14
            case .placeHolderSearchText: return 16
            }
        }
        
        var custom: String {
            switch self {
            case .tripNm, .gpHeader, .tripDetailNameHeader, .buttonTextWithBold, .changeTime: return "Satoshi-Bold"
            case .tripSD, .tripED, .tripDest, .tripDeetsBody, .placeHolderSearchText: return "Satoshi-Medium"
            case .regularText: return "Satoshi-Regular"
            case .blacked: return "Satoshi-Black"
            }
        }
    }
}


