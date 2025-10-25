//
//  SettingsView.swift
//  VShip
//
//  Settings view for managing API token and preferences
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var deploymentService: DeploymentService
    @StateObject private var appSettings = AppSettings.shared
    @StateObject private var updateChecker = UpdateChecker.shared
    @Environment(\.dismiss) var dismiss
    @State private var showingSignOutAlert = false
    @State private var isCheckingForUpdates = false

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Settings")
                    .font(.headline)
                    .fontWeight(.semibold)

                Spacer()

                Button(action: { dismiss() }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                        .font(.title3)
                }
                .buttonStyle(.plain)
            }
            .padding()

            Divider()

            // Content
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Account section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Account")
                        .font(.headline)
                        .fontWeight(.medium)

                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Vercel Account")
                                .font(.subheadline)

                            Text("Connected")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Button("Sign Out") {
                            showingSignOutAlert = true
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                    .background(Color(NSColor.controlBackgroundColor))
                    .cornerRadius(8)
                }

                // Appearance section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Appearance")
                        .font(.headline)
                        .fontWeight(.medium)

                    VStack(alignment: .leading, spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Triangle Style")
                                .foregroundColor(.secondary)
                                .font(.subheadline)

                            Picker("", selection: $appSettings.triangleStyle) {
                                ForEach(AppSettings.TriangleStyle.allCases, id: \.self) { style in
                                    Text(style.displayName).tag(style)
                                }
                            }
                            .pickerStyle(.segmented)

                            Text(appSettings.triangleStyle.description)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Divider()

                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text("Menu Bar Icon Color")
                                    .foregroundColor(.secondary)
                                Spacer()
                                Picker("", selection: $appSettings.iconColor) {
                                    ForEach(AppSettings.IconColor.allCases, id: \.self) { color in
                                        Text(color.rawValue).tag(color)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .frame(width: 120)
                            }
                            .font(.subheadline)

                            if appSettings.triangleStyle == .solid {
                                Text("Used for timeout color")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }

                        Divider()

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Success Indicator Timeout")
                                .foregroundColor(.secondary)
                                .font(.subheadline)

                            Picker("", selection: $appSettings.successTimeout) {
                                ForEach(AppSettings.SuccessTimeout.allCases, id: \.self) { timeout in
                                    Text(timeout.displayName).tag(timeout)
                                }
                            }
                            .pickerStyle(.menu)

                            Text("Green border turns white after successful deployment")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .background(Color(NSColor.controlBackgroundColor))
                    .cornerRadius(8)
                }

                // Notifications section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Notifications")
                        .font(.headline)
                        .fontWeight(.medium)

                    VStack(alignment: .leading, spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Toggle("Update Notifications", isOn: $appSettings.updateNotificationsEnabled)
                                .font(.subheadline)

                            Text("Show notifications when new versions are available")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Divider()

                        VStack(alignment: .leading, spacing: 4) {
                            Toggle("Deployment Notifications", isOn: $appSettings.deploymentNotificationsEnabled)
                                .font(.subheadline)

                            Text("Show notifications for deployment status changes")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Divider()

                        VStack(alignment: .leading, spacing: 4) {
                            Button(action: {
                                isCheckingForUpdates = true
                                updateChecker.checkForUpdates()

                                // Reset the checking state after a delay
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    isCheckingForUpdates = false
                                }
                            }) {
                                HStack {
                                    Text(isCheckingForUpdates ? "Checking..." : "Check for Updates")
                                        .font(.subheadline)

                                    Spacer()

                                    if isCheckingForUpdates {
                                        ProgressView()
                                            .scaleEffect(0.7)
                                            .frame(width: 16, height: 16)
                                    } else {
                                        Image(systemName: "arrow.down.circle")
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(.plain)
                            .disabled(isCheckingForUpdates)

                            if updateChecker.updateAvailable {
                                HStack(spacing: 4) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                        .font(.caption)
                                    Text("Version \(updateChecker.latestVersion) available")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            } else if !isCheckingForUpdates {
                                Text("You're up to date")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding()
                    .background(Color(NSColor.controlBackgroundColor))
                    .cornerRadius(8)
                }

                // About section
                VStack(alignment: .leading, spacing: 12) {
                    Text("About")
                        .font(.headline)
                        .fontWeight(.medium)

                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Version")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("0.9.0")
                            Text("Beta")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color.orange)
                                .cornerRadius(4)
                        }
                        .font(.subheadline)

                        Divider()

                        HStack {
                            Text("Build")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("1")
                        }
                        .font(.subheadline)
                    }
                    .padding()
                    .background(Color(NSColor.controlBackgroundColor))
                    .cornerRadius(8)
                }

                Spacer()

                // Footer
                VStack(spacing: 4) {
                    Text("Made with ♥ for Vercel developers")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Text("Follow me on Twitter (X)")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Button(action: {
                        if let url = URL(string: "https://x.com/_CharlesSO") {
                            NSWorkspace.shared.open(url)
                        }
                    }) {
                        Text("@_CharlesSO")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(.plain)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding()
            }
        }
        .frame(width: 360, height: 680)
        .background(Color(NSColor.windowBackgroundColor))
        .alert("Sign Out", isPresented: $showingSignOutAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Sign Out", role: .destructive) {
                deploymentService.removeToken()
                dismiss()
            }
        } message: {
            Text("Are you sure you want to sign out? You'll need to re-enter your API token to use VShip again.")
        }
    }
}

#Preview {
    SettingsView(deploymentService: DeploymentService())
}
