import Foundation
@testable import Weather

final class MockWeatherDataRepository: FetchWeatherRepositoryProtocol {
	var resultToReturn: Result<WeatherEntity, Error>?
	var lastLatitude: Double?
	var lastLongitude: Double?

	func fetchWeather(latitude: Double, longitude: Double) async throws -> WeatherEntity {
		lastLatitude = latitude
		lastLongitude = longitude
		
		switch resultToReturn {
			case .success(let entity): return entity
			case .failure(let error): throw error
			case .none: fatalError("Result not configured")
		}
	}
}
