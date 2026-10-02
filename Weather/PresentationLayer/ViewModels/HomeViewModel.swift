//
//  HomeViewModel.swift
//  Weather
//
//  Created by mango on 10/2/26.
//
import Observation
@Observable
class HomeViewModel {
	let repository: FetchWeatherRepositoryProtocol
	init(repository: FetchWeatherRepositoryProtocol) {
		self.repository = repository
	}
	
	func loadWeather(for city: String) async throws -> WeatherEntity {
		return WeatherEntity(temperature: 0, windSpeed: 0, weatherCode: 0, percipitationProbability: 0)
	}
}
