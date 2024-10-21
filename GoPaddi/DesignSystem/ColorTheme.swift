//
//  ColorTheme.swift
//  iosApp
//
//  Created by Adewale Sanusi on 10/10/2024.
//

import SwiftUI

public struct ColorThemeEnvironmentKey: EnvironmentKey {
    public static let defaultValue: ColorTheme = ColorThemeDefault()
}

extension EnvironmentValues {
    public var colorTheme: ColorTheme {
        get { self[ColorThemeEnvironmentKey.self] }
        set { self[ColorThemeEnvironmentKey.self] = newValue }
    }
}

public protocol ColorTheme {
    var gpWhite: Color { get }
    var gpLightBlue: Color { get }
    var gpBlue: Color { get }
    var gpBlack: Color { get }
    var gpGray1: Color { get }
    var gpGray2: Color { get }
    var gpDarkBlue: Color { get }
}

struct ColorThemeDefault: ColorTheme {
    let gpWhite = Color("GPWhite")
    let gpLightBlue = Color("GPLightBlue")
    let gpBlue = Color("GPBlue")
    let gpBlack = Color("GPBlack")
    let gpGray1 = Color("GPGray1")
    let gpGray2 = Color("GPGray2")
    //  backgrndGray
    let gpDarkBlue = Color("GPDarkBlue")
    let backgroundGray = Color("backgrndGray")
}

extension View {
    func colorThemeValue(_ colorThemeValue: ColorTheme) -> some View {
        environment(\.colorTheme, colorThemeValue)
    }

    func designSystemBackground(colorKey: KeyPath<ColorTheme, Color>) -> some View {
        background(Environment(\.colorTheme).wrappedValue[keyPath: colorKey])
    }

    func designSystemForegroundColor(colorKey: KeyPath<ColorTheme, Color>) -> some View {
        foregroundColor(Environment(\.colorTheme).wrappedValue[keyPath: colorKey])
    }
}
