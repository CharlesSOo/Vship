//
//  VShipApp.swift
//  VShip
//
//  Created by Claude Code
//

import SwiftUI

@main
struct VShipApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}
