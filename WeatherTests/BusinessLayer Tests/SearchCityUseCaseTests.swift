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
		let cities = [CityEntity]()
		let mockRepository = MockSearchCityDataRepository()
		let sut = await SearchCityUseCase(repository: mockRepository)
		let result = try await sut.search(for: "HCM")

		#expect(result.count == 1)
		#expect(result.first?.name == "Ho Chi Minh City")
	}

}
