//
//  HTTPClientProtocol.swift
//  Weather
//
//  Created by mango on 10/5/26.
//
protocol HTTPClientProtocol {
	func request<T: Decodable>(endpoint: Endpoint) async throws -> T
}
