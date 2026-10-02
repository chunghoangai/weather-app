//
//  SearchCityUseCaseTests.swift
//  WeatherTests
//
//  Created by mango on 10/2/26.
//

import Testing

@testable import Weather

enum DummyError: Error {
	case dummyError
}
@Suite("BusinessLayer TDD")
struct SearchCityUseCaseTests {
	@Test func executeSuccess() async throws {
		let cities = [CityEntity]()
		let mockRepository = MockSearchCityDataRepository()
		let sut = await SearchCityUseCase(repository: mockRepository)
		let result = try await sut.searh(for: "HCM")

		#expect(result.count == cities.count)
	}

}
