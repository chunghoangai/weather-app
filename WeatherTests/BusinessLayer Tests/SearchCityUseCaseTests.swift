//
//  SearchCityUseCaseTests.swift
//  WeatherTests
//
//  Created by mango on 10/2/26.
//

import Testing

@testable import Weather


@Suite("BusinessLayer TDD")
struct SearchCityUseCaseTests {
	@Test func executeSuccess() async throws {
		let cities = [CityEntity(name: "Ho Chi Minh City", country: "VN", latitude: 10.8167, longitude: 106.633, population: 13312000)]
		let mockRepository = MockSearchCityDataRepository()
		let sut = await SearchCityUseCase(repository: mockRepository)
		let result = try await sut.search(for: "HCM")

		#expect(result.first == cities.first)
	}

}
