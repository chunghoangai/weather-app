//
//  NetworkTransportProtocol.swift
//  Weather
//
//  Created by mango on 10/5/26.
//
import Foundation
protocol NetworkTransportProtocol {
	func send(request: URLRequest) async throws -> (Data, URLResponse)
}
