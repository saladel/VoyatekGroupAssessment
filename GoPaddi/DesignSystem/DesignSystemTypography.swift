//
//  ColorTheme.swift
//  iosApp
//
//  Created by Adewale Sanusi on 10/10/2024.
//

import SwiftUI

import SwiftUI

public struct DesignSystemTypography: ViewModifier {
    @Environment(\.colorTheme) private var colorTheme: ColorTheme
    
    var typography: DesignSystem.Typography
    var color: Color?

    public func body(content: Content) -> some View {
        content
            .font(.custom(typography.custom, size: typography.size))
            .foregroundColor(color ?? colorTheme.gpBlack)
    }
}

extension View {
    public func designSystemTypography(
        _ typography: DesignSystem.Typography,
        color: Color? = nil
    ) -> some View {
        self.modifier(DesignSystemTypography(typography: typography, color: color))
    }
}

struct DesignSystemTypography_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            Group {
                Text("Trip Name").designSystemTypography(.tripNm)
                Text("Trip Destination").designSystemTypography(.tripDest)
                Text("Trip Start Date").designSystemTypography(.tripSD)
                Text("Trip End Date").designSystemTypography(.tripED)
                Text("ASD FFK JKL").designSystemTypography(.tripDetailNameHeader)
            }
            .padding()
        }
        .padding()
        .frame(height: 960.0)
    }
}
