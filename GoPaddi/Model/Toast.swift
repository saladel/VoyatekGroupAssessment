//
//  Toast.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 16/10/2024.
//

import Foundation
import SwiftUI

struct Toast: Equatable {
    let message: String
    let type: ToastType
    let duration: TimeInterval
    
    enum ToastType {
        case success
        case error
        
        var backgroundColor: Color {
            switch self {
            case .success: return Color.green
            case .error: return Color.red
            }
        }
        
        var icon: String {
            switch self {
            case .success: return "checkmark.circle.fill"
            case .error: return "xmark.circle.fill"
            }
        }
    }
}
