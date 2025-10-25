//
//  AppDelegate.swift
//  VShip
//
//  Menu bar app delegate
//

import SwiftUI
import Combine
import UserNotifications

class AppDelegate: NSObject, NSApplicationDelegate, UNUserNotificationCenterDelegate {
    private var statusItem: NSStatusItem?
    private var popover: NSPopover?
    private var deploymentService: DeploymentService?
    private var cancellables = Set<AnyCancellable>()
    private var lastReadyTime: Date?
    private var timeoutCheckTimer: Timer?

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Set notification delegate to handle clicks
        UNUserNotificationCenter.current().delegate = self

        // Check for updates
        UpdateChecker.shared.checkForUpdatesIfNeeded()

        // Create status bar item
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        if let button = statusItem?.button {
            updateStatusIcon(status: .unknown)
            button.action = #selector(togglePopover)
            button.target = self
        }

        // Listen for icon color changes
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(iconColorDidChange),
            name: .iconColorChanged,
            object: nil
        )

        // Listen for triangle style changes
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(triangleStyleDidChange),
            name: .triangleStyleChanged,
            object: nil
        )

        // Create popover
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 360, height: 500)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: ContentView())
        self.popover = popover

        // Initialize deployment service
        deploymentService = DeploymentService()

        // Subscribe to deployment updates
        deploymentService?.latestDeploymentStatus
            .receive(on: DispatchQueue.main)
            .sink { [weak self] status in
                // Track when deployment becomes READY
                if status == .ready {
                    if self?.lastReadyTime == nil {
                        self?.lastReadyTime = Date()
                    }
                } else {
                    // Reset timer if status changes from READY
                    self?.lastReadyTime = nil
                }
                self?.updateStatusIcon(status: status)
            }
            .store(in: &cancellables)

        // Start monitoring
        deploymentService?.startMonitoring()

        // Check timeout every 30 seconds
        timeoutCheckTimer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { [weak self] _ in
            if let status = self?.deploymentService?.deployments.first?.status {
                self?.updateStatusIcon(status: status)
            }
        }
    }

    @objc func togglePopover() {
        if let button = statusItem?.button {
            if popover?.isShown == true {
                popover?.performClose(nil)
            } else {
                popover?.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
                popover?.contentViewController?.view.window?.becomeKey()
            }
        }
    }

    @objc func iconColorDidChange() {
        // Refresh icon with new color
        if let status = deploymentService?.deployments.first?.status {
            updateStatusIcon(status: status)
        } else {
            updateStatusIcon(status: .unknown)
        }
    }

    @objc func triangleStyleDidChange() {
        // Refresh icon with new style
        if let status = deploymentService?.deployments.first?.status {
            updateStatusIcon(status: status)
        } else {
            updateStatusIcon(status: .unknown)
        }
    }

    private func updateStatusIcon(status: DeploymentStatus) {
        guard let button = statusItem?.button else { return }

        let triangleStyle = AppSettings.shared.triangleStyle

        if triangleStyle == .solid {
            // Solid color mode - fill triangle with status color
            renderSolidTriangle(status: status, button: button)
        } else {
            // Border mode - white/black triangle with colored border
            renderBorderedTriangle(status: status, button: button)
        }
    }

    private func renderSolidTriangle(status: DeploymentStatus, button: NSStatusBarButton) {
        let iconColor = AppSettings.shared.iconColor.nsColor

        // Determine fill color based on status and timeout
        let fillColor: NSColor
        if status == .ready {
            let timeout = AppSettings.shared.successTimeout
            if timeout == .never {
                // Always show green
                fillColor = status.color
            } else if let readyTime = lastReadyTime {
                let elapsed = Date().timeIntervalSince(readyTime)
                if elapsed >= TimeInterval(timeout.rawValue) {
                    // Timeout elapsed, show white/black
                    fillColor = iconColor
                } else {
                    // Still within timeout, show green
                    fillColor = status.color
                }
            } else {
                // Just became ready, show green
                fillColor = status.color
            }
        } else {
            // Not ready, show appropriate color
            fillColor = status.color
        }

        let imageSize = NSSize(width: 22, height: 22)
        let image = NSImage(size: imageSize)

        image.lockFocus()

        // Define triangle path (Vercel logo style)
        let path = NSBezierPath()
        let triangleHeight: CGFloat = 15
        let triangleWidth: CGFloat = 16
        let centerX = imageSize.width / 2
        let centerY = imageSize.height / 2

        path.move(to: NSPoint(x: centerX, y: centerY + triangleHeight/2))
        path.line(to: NSPoint(x: centerX - triangleWidth/2, y: centerY - triangleHeight/2))
        path.line(to: NSPoint(x: centerX + triangleWidth/2, y: centerY - triangleHeight/2))
        path.close()

        // Fill with determined color - NO outline, completely solid
        fillColor.setFill()
        path.fill()

        image.unlockFocus()
        image.isTemplate = false

        button.image = image
    }

    private func renderBorderedTriangle(status: DeploymentStatus, button: NSStatusBarButton) {
        // Get user's preferred icon color
        let iconColor = AppSettings.shared.iconColor.nsColor

        // Determine border color based on status and timeout
        let borderColor: NSColor
        if status == .ready {
            let timeout = AppSettings.shared.successTimeout
            if timeout == .never {
                borderColor = status.color
            } else if let readyTime = lastReadyTime {
                let elapsed = Date().timeIntervalSince(readyTime)
                if elapsed >= TimeInterval(timeout.rawValue) {
                    borderColor = iconColor
                } else {
                    borderColor = status.color
                }
            } else {
                borderColor = status.color
            }
        } else {
            borderColor = status.color
        }

        let imageSize = NSSize(width: 22, height: 22)
        let image = NSImage(size: imageSize)

        image.lockFocus()

        // Define triangle path (Vercel logo style)
        let path = NSBezierPath()
        let triangleHeight: CGFloat = 15
        let triangleWidth: CGFloat = 16
        let centerX = imageSize.width / 2
        let centerY = imageSize.height / 2

        path.move(to: NSPoint(x: centerX, y: centerY + triangleHeight/2))
        path.line(to: NSPoint(x: centerX - triangleWidth/2, y: centerY - triangleHeight/2))
        path.line(to: NSPoint(x: centerX + triangleWidth/2, y: centerY - triangleHeight/2))
        path.close()

        // Fill with icon color (white or black)
        iconColor.setFill()
        path.fill()

        // Draw colored border
        borderColor.setStroke()
        path.lineWidth = 2.5
        path.stroke()

        image.unlockFocus()
        image.isTemplate = false

        button.image = image
    }

    // MARK: - UNUserNotificationCenterDelegate

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        // Handle notification click
        if let downloadURL = response.notification.request.content.userInfo["downloadURL"] as? String {
            if let url = URL(string: downloadURL) {
                NSWorkspace.shared.open(url)
            }
        }
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Show notification even when app is active
        completionHandler([.banner, .sound])
    }
}

extension DeploymentStatus {
    var color: NSColor {
        switch self {
        case .ready:
            return NSColor(red: 0.0, green: 0.8, blue: 0.0, alpha: 1.0) // Flat Green
        case .building, .queued:
            return NSColor(red: 1.0, green: 0.8, blue: 0.0, alpha: 1.0) // Flat Yellow
        case .error, .canceled:
            return NSColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0) // Flat Red
        case .unknown:
            return NSColor.systemGray
        }
    }
}
