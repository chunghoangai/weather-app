//
//  HomeViewModelTests.swift
//  Weather
//
//  Created by mango on 10/2/26.
//
import Testing

@testable import Weather

@Suite("PresentationLayer Test")
struct HomeViewModelTests {
	func makeSUT() -> MockWeatherDataRepository {
		let expectedWeather = WeatherEntity(
			temperature: 28.5,
			windSpeed: 12.0,
			weatherCode: 0,
			percipitationProbability: 15
		)
		
		let mockRepository = MockWeatherDataRepository()
		mockRepository.resultToReturn = .success(expectedWeather)
		return mockRepository
	}
	@Test
	func loadWeatherSuccess() async {
		let mockRepo = makeSUT()
		let viewModel = HomeViewModel(weatherRepository: mockRepo)
		await viewModel.loadWeather(for: "HCM")
		#expect(mockRepo != nil)
	}

}
