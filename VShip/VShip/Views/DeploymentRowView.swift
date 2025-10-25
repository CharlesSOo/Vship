//
//  DeploymentRowView.swift
//  VShip
//
//  Individual deployment row in the list
//

import SwiftUI

struct DeploymentRowView: View {
    let deployment: Deployment
    @State private var elapsedTime: String = ""
    @State private var timer: Timer?

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Status and name
            HStack {
                // Status indicator
                Circle()
                    .fill(statusColor)
                    .frame(width: 8, height: 8)

                Text(deployment.name)
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.medium)
                    .lineLimit(1)

                Spacer()

                Text(deployment.status.displayName)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(statusColor.opacity(0.2))
                    .foregroundColor(statusColor)
                    .cornerRadius(4)
            }

            // Commit message
            HStack(spacing: 4) {
                Image(systemName: "text.quote")
                    .font(.caption)
                    .foregroundColor(.secondary)

                Text(deployment.commitMessage)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }

            // Branch and time
            HStack {
                HStack(spacing: 4) {
                    Image(systemName: "arrow.branch")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Text(deployment.branch)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()

                if deployment.status == .building || deployment.status == .queued {
                    Text(elapsedTime)
                        .font(.caption)
                        .foregroundColor(.secondary)
                } else {
                    Text(timeAgo)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            // Inspect button
            Button(action: openInVercel) {
                HStack {
                    Image(systemName: "arrow.up.forward.square")
                        .font(.caption)
                    Text("Inspect on Vercel")
                        .font(.caption)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 6)
                .background(Color.accentColor.opacity(0.1))
                .foregroundColor(.accentColor)
                .cornerRadius(6)
            }
            .buttonStyle(.plain)
        }
        .onAppear {
            if deployment.status == .building || deployment.status == .queued {
                startElapsedTimer()
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    private var statusColor: Color {
        switch deployment.status {
        case .ready:
            return .green
        case .building, .queued:
            return .orange
        case .error, .canceled:
            return .red
        case .unknown:
            return .gray
        }
    }

    private var timeAgo: String {
        let now = Date()
        let interval = now.timeIntervalSince(deployment.createdDate)

        if interval < 60 {
            return "just now"
        } else if interval < 3600 {
            let minutes = Int(interval / 60)
            return "\(minutes)m ago"
        } else if interval < 86400 {
            let hours = Int(interval / 3600)
            return "\(hours)h ago"
        } else {
            let days = Int(interval / 86400)
            return "\(days)d ago"
        }
    }

    private func startElapsedTimer() {
        updateElapsedTime()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            updateElapsedTime()
        }
    }

    private func updateElapsedTime() {
        let now = Date()
        let interval = now.timeIntervalSince(deployment.createdDate)
        let minutes = Int(interval / 60)
        let seconds = Int(interval.truncatingRemainder(dividingBy: 60))
        elapsedTime = String(format: "%d:%02d elapsed", minutes, seconds)
    }

    private func openInVercel() {
        if let url = deployment.inspectURL {
            NSWorkspace.shared.open(url)
        }
    }
}

#Preview {
    DeploymentRowView(deployment: Deployment(
        uid: "dpl_abc123",
        name: "my-app",
        url: "https://my-app.vercel.app",
        state: "READY",
        created: Int64(Date().timeIntervalSince1970 * 1000),
        readyState: "READY",
        meta: Deployment.Meta(
            githubCommitMessage: "Add new feature",
            githubCommitRef: "main",
            githubCommitSha: "abc123"
        )
    ))
    .padding()
}
