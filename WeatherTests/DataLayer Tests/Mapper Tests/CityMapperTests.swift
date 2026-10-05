//
//  CityMapperTests.swift
//  Weather
//
//  Created by mango on 10/5/26.
//

import Testing
@testable import Weather

@Suite("CityMapper Tests")
struct CityMapperTests {

	@Test func testMap_transformsSearchCityDTOToCityEntity() {
		// Given
		let mapper = CityMapper()
		let dto = SearchCityDTO(
			name: "San Francisco",
			country: "US",
			latitude: 37.7749,
			longitude: -122.4194,
			population: 873965
		)

		// When
		let entity = mapper.map(dto: dto)

		// Then
		#expect(entity.name == "San Francisco")
		#expect(entity.country == "US")
		#expect(entity.latitude == 37.7749)
		#expect(entity.longitude == -122.4194)
		#expect(entity.population == 873965)
	}
}
