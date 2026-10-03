//
//  MockSearchCityDataRepository.swift
//  Weather
//
//  Created by mango on 10/2/26.
//
import Foundation
@testable import Weather

final class MockSearchCityDataRepository: SearchCityRepositoryProtocol {
	var returnCities: [CityEntity] = [CityEntity(name: "Ho Chi Minh City", country: "VN", latitude: 10.8167, longitude: 106.633, population: 13312000)]
	func search(for city: String) async throws -> [CityEntity] {
		return returnCities
	}
}
