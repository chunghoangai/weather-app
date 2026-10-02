import Foundation
protocol FetchWeatherUseCaseProtocol {
	func execute(latitude: Double, longitude: Double) async throws -> WeatherEntity
}

class FetchWeatherUseCase: FetchWeatherUseCaseProtocol {
	let repository: FetchWeatherRepositoryProtocol
	init(repository: FetchWeatherRepositoryProtocol) {
		self.repository = repository
	}
	func execute(latitude: Double, longitude: Double) async throws -> WeatherEntity {
		try await repository.fetchWeather(latitude: latitude, longitude: longitude)
	}
}
