//
//  SearchCityRepositoryTest.swift
//  Weather
//
//  Created by mango on 10/4/26.
//

import Testing
@testable import Weather
import Foundation

@Suite("SearchCity Tests")
struct SearchCityRepositoryTest {

	@Test func testSuccessSearch() async throws {
		// Given
		let mockDTOs = [
			SearchCityDTO(
				name: "Ho Chi Minh City",
				country: "VN",
				latitude: 10.8231,
				longitude: 106.6297,
				population: 9000000
			)
		]
		let mockClient = MockHttpClient(resultToReturn: mockDTOs)
		let repository = await SearchCityRepository(client: mockClient)

		// When
		let result = try await repository.search(for: "Ho Chi Minh City")

		// Then
		#expect(result.count == 1)
		#expect(result.first?.name == "Ho Chi Minh City")
		#expect(result.first?.country == "VN")
		#expect(result.first?.latitude == 10.8231)
		#expect(result.first?.longitude == 106.6297)
		#expect(result.first?.population == 9000000)
		#expect(mockClient.requestedEndpoint?.path == "v1/city")
		#expect(mockClient.requestedEndpoint?.queryItems.first?.value == "Ho Chi Minh City")
	}

	@Test func testFailureSearch_whenClientThrowsError_propagatesError() async {
		// Given
		let mockClient = MockHttpClient(errorToThrow: CommonNetworkError.invalidResponse)
		let repository = await SearchCityRepository(client: mockClient)

		// When & Then
		await #expect(throws: CommonNetworkError.self) {
			try await repository.search(for: "InvalidCity")
		}
	}
}
