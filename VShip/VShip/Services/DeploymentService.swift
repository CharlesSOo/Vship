//
//  DeploymentService.swift
//  VShip
//
//  Service for fetching and monitoring Vercel deployments
//

import Foundation
import Combine

class DeploymentService: ObservableObject {
    @Published var deployments: [Deployment] = []
    @Published var isLoading = false
    @Published var error: Error?
    @Published var hasToken = false

    private let keychainManager = KeychainManager()
    private var timer: Timer?
    private let pollingInterval: TimeInterval = 30 // 30 seconds

    var latestDeploymentStatus: AnyPublisher<DeploymentStatus, Never> {
        $deployments
            .map { deployments in
                deployments.first?.status ?? .unknown
            }
            .eraseToAnyPublisher()
    }

    init() {
        hasToken = keychainManager.getToken() != nil
    }

    func startMonitoring() {
        // Initial fetch
        fetchDeployments()

        // Set up polling
        timer = Timer.scheduledTimer(withTimeInterval: pollingInterval, repeats: true) { [weak self] _ in
            self?.fetchDeployments()
        }
    }

    func stopMonitoring() {
        timer?.invalidate()
        timer = nil
    }

    func fetchDeployments() {
        guard let token = keychainManager.getToken() else {
            hasToken = false
            return
        }

        hasToken = true
        isLoading = true
        error = nil

        let url = URL(string: "https://api.vercel.com/v6/deployments")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false

                if let error = error {
                    print("❌ Network error: \(error.localizedDescription)")
                    self?.error = error
                    return
                }

                guard let data = data else {
                    print("❌ No data received")
                    return
                }

                // Debug: Print raw response
                if let httpResponse = response as? HTTPURLResponse {
                    print("📡 HTTP Status: \(httpResponse.statusCode)")
                }

                // Debug: Print JSON response
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("📦 API Response: \(jsonString.prefix(500))...")
                }

                do {
                    let decoder = JSONDecoder()
                    let deploymentsResponse = try decoder.decode(DeploymentsResponse.self, from: data)
                    print("✅ Successfully decoded \(deploymentsResponse.deployments.count) deployments")
                    self?.deployments = deploymentsResponse.deployments
                } catch let decodingError as DecodingError {
                    print("❌ Decoding error: \(decodingError)")
                    switch decodingError {
                    case .keyNotFound(let key, let context):
                        print("   Missing key: \(key.stringValue)")
                        print("   Context: \(context.debugDescription)")
                    case .typeMismatch(let type, let context):
                        print("   Type mismatch for type: \(type)")
                        print("   Context: \(context.debugDescription)")
                    case .valueNotFound(let type, let context):
                        print("   Value not found for type: \(type)")
                        print("   Context: \(context.debugDescription)")
                    case .dataCorrupted(let context):
                        print("   Data corrupted: \(context.debugDescription)")
                    @unknown default:
                        print("   Unknown decoding error")
                    }
                    self?.error = decodingError
                } catch {
                    print("❌ Unknown error: \(error)")
                    self?.error = error
                }
            }
        }.resume()
    }

    func saveToken(_ token: String) {
        keychainManager.saveToken(token)
        hasToken = true
        fetchDeployments()
    }

    func removeToken() {
        keychainManager.deleteToken()
        hasToken = false
        deployments = []
        stopMonitoring()
    }

    deinit {
        stopMonitoring()
    }
}
