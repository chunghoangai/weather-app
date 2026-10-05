//
//  Endpoint.swift
//  Weather
//
//  Created by mango on 10/5/26.
//

import Foundation
struct Endpoint {
	let path: String
	let method: HTTPMethod
	let queryItems: [URLQueryItem]

	enum HTTPMethod: String {
		case get = "GET"
		case post = "POST"
	}
}

extension Endpoint {
	static func searchCity(name: String) -> Endpoint {
		Endpoint(
			path: "v1/city",
			method: .get,
			queryItems: [URLQueryItem(name: "name",value: name)]
		)
	}
}
