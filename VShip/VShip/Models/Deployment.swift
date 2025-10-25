//
//  Deployment.swift
//  VShip
//
//  Data models for Vercel deployments
//

import Foundation

struct Deployment: Codable, Identifiable {
    let uid: String
    let name: String
    let url: String?
    let state: String?
    let created: Int64?
    let readyState: String?
    let meta: Meta?

    // Conform to Identifiable
    var id: String { uid }

    struct Meta: Codable {
        let githubCommitMessage: String?
        let githubCommitRef: String?
        let githubCommitSha: String?

        enum CodingKeys: String, CodingKey {
            case githubCommitMessage
            case githubCommitRef
            case githubCommitSha
        }
    }

    var status: DeploymentStatus {
        guard let readyState = readyState else { return .unknown }
        return DeploymentStatus(rawValue: readyState.uppercased()) ?? .unknown
    }

    var commitMessage: String {
        meta?.githubCommitMessage ?? "No commit message"
    }

    var branch: String {
        meta?.githubCommitRef ?? "main"
    }

    var createdDate: Date {
        guard let created = created else { return Date() }
        return Date(timeIntervalSince1970: TimeInterval(created) / 1000)
    }

    var inspectURL: URL? {
        return URL(string: "https://vercel.com/dashboard/deployments/\(uid)")
    }
}

struct DeploymentsResponse: Codable {
    let deployments: [Deployment]
}

enum DeploymentStatus: String, Codable {
    case ready = "READY"
    case building = "BUILDING"
    case queued = "QUEUED"
    case error = "ERROR"
    case canceled = "CANCELED"
    case unknown = "UNKNOWN"

    var displayName: String {
        switch self {
        case .ready: return "Success"
        case .building: return "Building"
        case .queued: return "Queued"
        case .error: return "Failed"
        case .canceled: return "Canceled"
        case .unknown: return "Unknown"
        }
    }
}
