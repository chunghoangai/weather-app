protocol WeatherDataRepositoryProtocol {
	func fetchWeather(latitude: Double, longitude: Double) async throws -> WeatherEntity
}
