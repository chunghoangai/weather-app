//
//  FetchWeatherUseCase.swift
//  WeatherTests
//
//  Created by mango on 10/2/26.
//

import Testing
@testable import Weather
@Suite("BusinessLayer TDD")
struct FetchWeatherUseCase {
    @Test func testFetchWeatherData() async throws {
        let expectedWeather = WeatherEntity(
            temperature: 28.5,
            windSpeed: 12.0,
            weatherCode: 0,
            precipitationProbability: 15
        )
        
        let mockRepository = MockWeatherDataRepository()
        mockRepository.resultToReturn = .success(expectedWeather)
        
        let sut = FetchWeatherUseCase(repository: mockRepository)
        let result = try await sut.execute(latitude: 10.8231, longitude: 106.6297)
        
        #expect(result == expectedWeather)
    }

}
