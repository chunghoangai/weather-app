//
//  HTTPClient.swift
//  Weather
//
//  Created by mango on 10/5/26.
//
import Foundation


enum CommonNetworkError: Error {
	case invalidURL
	case invalidResponse
	case serverErorr(statusCode: Int)
}
struct URLSessionHTTPClient: HTTPClientProtocol {
	let baseURL: URL
	let apiKey: String
	let networkTransport: NetworkTransportProtocol
	init(baseURL: URL = URL(string: "https://api.api-ninjas.com")!, apiKey: String, networkTransport: NetworkTransportProtocol) {
		self.baseURL = baseURL
		self.apiKey = apiKey
		self.networkTransport = networkTransport
	}
	func request<T>(endpoint: Endpoint) async throws -> T where T : Decodable {
		var components = URLComponents(url: baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: true)
		if !endpoint.queryItems.isEmpty {
			components?.queryItems = endpoint.queryItems
		}
		guard let url = components?.url else {
			throw CommonNetworkError.invalidURL
		}
		
		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = endpoint.method.rawValue
		urlRequest.setValue("", forHTTPHeaderField: "X-Api-Key")
		let (data, response) = try await networkTransport.send(request: urlRequest)
		let code = response
		guard let httpResponse = response as? HTTPURLResponse else {
			throw CommonNetworkError.invalidResponse
		}
		let statusCode = httpResponse.statusCode
		guard (200...299).contains(statusCode) else {
			throw CommonNetworkError.serverErorr(statusCode: statusCode)
		}
		
		return try JSONDecoder().decode(T.self, from: data)
	}
}
