//
//  ContentView.swift
//  VShip
//
//  Main content view displayed in the popover
//

import SwiftUI

struct ContentView: View {
    @StateObject private var deploymentService = DeploymentService()
    @StateObject private var updateChecker = UpdateChecker.shared
    @State private var showingSettings = false

    var body: some View {
        VStack(spacing: 0) {
            if !deploymentService.hasToken {
                OnboardingView(deploymentService: deploymentService)
            } else {
                // Update banner
                if updateChecker.updateAvailable {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Update Available")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("Version \(updateChecker.latestVersion) is ready to download")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Button("Download") {
                            updateChecker.openDownloadPage()
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.small)
                    }
                    .padding()
                    .background(Color.accentColor.opacity(0.1))

                    Divider()
                }

                // Header
                HStack {
                    Text("Deployments")
                        .font(.headline)
                        .fontWeight(.semibold)

                    Spacer()

                    Button(action: { deploymentService.fetchDeployments() }) {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.secondary)
                    }
                    .buttonStyle(.plain)
                    .help("Refresh")

                    Button(action: { showingSettings = true }) {
                        Image(systemName: "gear")
                            .foregroundColor(.secondary)
                    }
                    .buttonStyle(.plain)
                    .help("Settings")
                }
                .padding()

                Divider()

                // Deployments list
                if deploymentService.isLoading && deploymentService.deployments.isEmpty {
                    VStack {
                        Spacer()
                        ProgressView()
                        Text("Loading deployments...")
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                        Spacer()
                    }
                } else if let error = deploymentService.error {
                    VStack {
                        Spacer()
                        Image(systemName: "exclamationmark.triangle")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                        Text("Error loading deployments")
                            .font(.headline)
                        Text(error.localizedDescription)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding()
                        Button("Retry") {
                            deploymentService.fetchDeployments()
                        }
                        Spacer()
                    }
                    .padding()
                } else if deploymentService.deployments.isEmpty {
                    VStack {
                        Spacer()
                        Image(systemName: "tray")
                            .font(.largeTitle)
                            .foregroundColor(.secondary)
                        Text("No deployments found")
                            .font(.headline)
                        Text("Your Vercel deployments will appear here")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    .padding()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(deploymentService.deployments) { deployment in
                                DeploymentRowView(deployment: deployment)
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)

                                if deployment.id != deploymentService.deployments.last?.id {
                                    Divider()
                                        .padding(.horizontal)
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }

                // Footer with Quit button
                Divider()

                HStack {
                    Spacer()
                    Button(action: {
                        NSApplication.shared.terminate(nil)
                    }) {
                        Text("Quit VShip")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .buttonStyle(.plain)
                    Spacer()
                }
                .padding(.vertical, 8)
                .background(Color(NSColor.controlBackgroundColor))
            }
        }
        .frame(width: 360, height: 500)
        .background(Color(NSColor.windowBackgroundColor))
        .sheet(isPresented: $showingSettings) {
            SettingsView(deploymentService: deploymentService)
        }
        .onAppear {
            deploymentService.startMonitoring()
        }
    }
}

#Preview {
    ContentView()
}
