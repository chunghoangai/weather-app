//
//  SearchCityRepositoryTest.swift
//  Weather
//
//  Created by mango on 10/4/26.
//

import Testing
@testable import Weather

@Suite("SearchCity Tests")
struct SearchCityRepositoryTest {
	@Test func testSuccessSearch() async {
		let cityEntities = [CityEntityDTO]
		let repository = MockSearchCityRepository()
		let result = repository.search(for: "HCM")
		#expect(!result.isEmpty)
	}
	
}
