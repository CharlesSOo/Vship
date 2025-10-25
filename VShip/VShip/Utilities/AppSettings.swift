//
//  AppSettings.swift
//  VShip
//
//  User preferences and settings management
//

import Foundation
import SwiftUI

class AppSettings: ObservableObject {
    static let shared = AppSettings()

    private let defaults = UserDefaults.standard
    private let iconColorKey = "iconColor"
    private let successTimeoutKey = "successTimeout"
    private let triangleStyleKey = "triangleStyle"

    enum TriangleStyle: String, CaseIterable {
        case border = "Border"
        case solid = "Solid"

        var displayName: String {
            switch self {
            case .border: return "Colored Border"
            case .solid: return "Solid Color"
            }
        }

        var description: String {
            switch self {
            case .border: return "White/Black triangle with colored border"
            case .solid: return "Triangle filled with status color"
            }
        }
    }

    enum IconColor: String, CaseIterable {
        case white = "White"
        case black = "Black"

        var nsColor: NSColor {
            switch self {
            case .white:
                return NSColor.white
            case .black:
                return NSColor.black
            }
        }
    }

    enum SuccessTimeout: Int, CaseIterable {
        case never = 0
        case fiveMinutes = 300
        case tenMinutes = 600
        case thirtyMinutes = 1800
        case oneHour = 3600

        var displayName: String {
            switch self {
            case .never: return "Never"
            case .fiveMinutes: return "5 minutes"
            case .tenMinutes: return "10 minutes"
            case .thirtyMinutes: return "30 minutes"
            case .oneHour: return "1 hour"
            }
        }
    }

    @Published var iconColor: IconColor {
        didSet {
            defaults.set(iconColor.rawValue, forKey: iconColorKey)
            NotificationCenter.default.post(name: .iconColorChanged, object: nil)
        }
    }

    @Published var successTimeout: SuccessTimeout {
        didSet {
            defaults.set(successTimeout.rawValue, forKey: successTimeoutKey)
        }
    }

    @Published var triangleStyle: TriangleStyle {
        didSet {
            defaults.set(triangleStyle.rawValue, forKey: triangleStyleKey)
            NotificationCenter.default.post(name: .triangleStyleChanged, object: nil)
        }
    }

    init() {
        // Default to white
        if let savedColor = defaults.string(forKey: iconColorKey),
           let color = IconColor(rawValue: savedColor) {
            self.iconColor = color
        } else {
            self.iconColor = .white
        }

        // Default to 10 minutes
        let savedTimeout = defaults.integer(forKey: successTimeoutKey)
        if let timeout = SuccessTimeout(rawValue: savedTimeout) {
            self.successTimeout = timeout
        } else {
            self.successTimeout = .tenMinutes
        }

        // Default to border style
        if let savedStyle = defaults.string(forKey: triangleStyleKey),
           let style = TriangleStyle(rawValue: savedStyle) {
            self.triangleStyle = style
        } else {
            self.triangleStyle = .border
        }
    }
}

extension Notification.Name {
    static let iconColorChanged = Notification.Name("iconColorChanged")
    static let triangleStyleChanged = Notification.Name("triangleStyleChanged")
}
