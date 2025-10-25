//
//  OnboardingView.swift
//  VShip
//
//  Initial setup view for entering Vercel API token
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var deploymentService: DeploymentService
    @State private var apiToken = ""
    @State private var isValidating = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Image(systemName: "triangle.fill")
                .font(.system(size: 48))
                .foregroundColor(.accentColor)

            Text("Welcome to VShip")
                .font(.title2)
                .fontWeight(.bold)

            Text("Monitor your Vercel deployments\nfrom your menu bar")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)

            VStack(alignment: .leading, spacing: 8) {
                Text("Vercel API Token")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)

                SecureField("Enter your token", text: $apiToken)
                    .textFieldStyle(.roundedBorder)
                    .disabled(isValidating)

                HStack {
                    Image(systemName: "info.circle")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Link("Get your token", destination: URL(string: "https://vercel.com/account/tokens")!)
                        .font(.caption)
                }
            }
            .padding(.horizontal)

            Button(action: saveToken) {
                if isValidating {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .controlSize(.small)
                } else {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(apiToken.isEmpty || isValidating)
            .padding(.horizontal)

            Spacer()
        }
        .padding()
    }

    private func saveToken() {
        isValidating = true
        // Add small delay to show loading state
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            deploymentService.saveToken(apiToken)
            isValidating = false
        }
    }
}

#Preview {
    OnboardingView(deploymentService: DeploymentService())
}
