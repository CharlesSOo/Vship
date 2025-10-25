//
//  UpdateChecker.swift
//  VShip
//
//  Simple update checker that fetches version from website
//

import Foundation
import AppKit
import UserNotifications
import Combine

class UpdateChecker: ObservableObject {
    static let shared = UpdateChecker()

    @Published var updateAvailable: Bool = false
    @Published var latestVersion: String = ""
    @Published var downloadURL: String = ""

    private let versionURL = "https://vship-pl6ul8y9x-meckins-projects.vercel.app/version.json"
    private let lastCheckKey = "lastUpdateCheck"
    private let currentVersion = "0.9.0"

    struct VersionInfo: Codable {
        let version: String
        let downloadUrl: String
    }

    init() {
        // Request notification permissions
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Notification permission error: \(error)")
            }
        }
    }

    func checkForUpdatesIfNeeded() {
        // Check if we've already checked today
        let lastCheck = UserDefaults.standard.object(forKey: lastCheckKey) as? Date ?? Date.distantPast
        let calendar = Calendar.current

        if calendar.isDateInToday(lastCheck) {
            print("Already checked for updates today")
            return
        }

        checkForUpdates()
    }

    func checkForUpdates() {
        guard let url = URL(string: versionURL) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }

            if let error = error {
                print("Update check error: \(error)")
                return
            }

            guard let data = data else { return }

            do {
                let versionInfo = try JSONDecoder().decode(VersionInfo.self, from: data)

                DispatchQueue.main.async {
                    // Save last check date
                    UserDefaults.standard.set(Date(), forKey: self.lastCheckKey)

                    // Compare versions
                    if self.isNewerVersion(versionInfo.version, than: self.currentVersion) {
                        self.latestVersion = versionInfo.version
                        self.downloadURL = versionInfo.downloadUrl
                        self.updateAvailable = true
                        self.showUpdateNotification(version: versionInfo.version, url: versionInfo.downloadUrl)
                    } else {
                        print("App is up to date (\(self.currentVersion))")
                    }
                }
            } catch {
                print("Failed to decode version info: \(error)")
            }
        }.resume()
    }

    private func isNewerVersion(_ new: String, than current: String) -> Bool {
        // Simple version comparison (works for X.Y.Z format)
        let newComponents = new.components(separatedBy: ".").compactMap { Int($0) }
        let currentComponents = current.components(separatedBy: ".").compactMap { Int($0) }

        for (index, newValue) in newComponents.enumerated() {
            guard index < currentComponents.count else { return true }
            let currentValue = currentComponents[index]

            if newValue > currentValue {
                return true
            } else if newValue < currentValue {
                return false
            }
        }

        return false
    }

    private func showUpdateNotification(version: String, url: String) {
        // Check if user has notifications enabled
        guard AppSettings.shared.updateNotificationsEnabled else {
            print("Update notifications disabled in settings")
            return
        }

        let content = UNMutableNotificationContent()
        content.title = "VShip Update Available"
        content.body = "Version \(version) is now available. Click to download."
        content.sound = .default
        content.userInfo = ["downloadURL": url]

        let request = UNNotificationRequest(
            identifier: "vship-update",
            content: content,
            trigger: nil  // Show immediately
        )

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to show notification: \(error)")
            }
        }
    }

    func openDownloadPage() {
        if let url = URL(string: downloadURL) {
            NSWorkspace.shared.open(url)
        }
    }
}
