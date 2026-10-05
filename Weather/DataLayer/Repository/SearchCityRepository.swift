//
//  SearchCityRepository.swift
//  Weather
//
//  Created by mango on 10/4/26.
//

import Foundation


class SearchCityRepository: SearchCityRepositoryProtocol {
	private let client: HTTPClientProtocol
	private let mapper: CityMapperProtocol
	
	init(client: HTTPClientProtocol, mapper: CityMapperProtocol = CityMapper()) {
		self.client = client
		self.mapper = mapper
	}
	func search(for city: String) async throws -> [CityEntity] {
		let cities: [SearchCityDTO] = try await client.request(endpoint: .searchCity(name: city))
		
		return cities.map { mapper.map(dto: $0) }
	}
}
