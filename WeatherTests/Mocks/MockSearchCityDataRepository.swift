//
//  MockSearchCityDataRepository.swift
//  Weather
//
//  Created by mango on 10/2/26.
//
import Foundation
@testable import Weather

final class MockSearchCityDataRepository: SearchCityRepositoryProtocol {
	var returnCities: [CityEntity] = []
	func search(for city: String) async throws -> [CityEntity] {
		return returnCities
	}
}
