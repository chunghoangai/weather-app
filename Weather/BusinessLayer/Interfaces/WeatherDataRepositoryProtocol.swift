protocol FetchWeatherRepositoryProtocol {
	func fetchWeather(latitude: Double, longitude: Double) async throws -> WeatherEntity
}
