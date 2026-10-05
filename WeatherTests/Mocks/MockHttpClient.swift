//
//  MockHttpClient.swift
//  Weather
//
//  Created by mango on 10/5/26.
//

import Foundation
@testable import Weather

final class MockHttpClient: HTTPClientProtocol {
	var resultToReturn: Any?
	var errorToThrow: Error?
	private(set) var requestedEndpoint: Endpoint?
	
	init(resultToReturn: Any? = nil, errorToThrow: Error? = nil) {
		self.resultToReturn = resultToReturn
		self.errorToThrow = errorToThrow
	}
	
	func request<T>(endpoint: Endpoint) async throws -> T where T : Decodable {
		self.requestedEndpoint = endpoint
		
		if let error = errorToThrow {
			throw error
		}
		
		guard let result = resultToReturn as? T else {
			throw CommonNetworkError.invalidResponse
		}
		
		return result
	}
}
