//
//  URLSessionTransport.swift
//  Weather
//
//  Created by mango on 10/5/26.
//

import Foundation

struct URLSessionTransport: NetworkTransportProtocol {
	private let session: URLSession
	init(session: URLSession = .shared) {
		self.session = session
	}
	
	func send(request: URLRequest) async throws -> (Data, URLResponse) {
		try await session.data(for: request)
	}
}
