import Foundation
protocol SearchCityUseCaseProtocol {
	func search(for city: String) async throws -> [CityEntity]
}

class SearchCityUseCase: SearchCityUseCaseProtocol {
	let repository: SearchCityRepositoryProtocol
	private var latestSearch: String?
	init(repository: SearchCityRepositoryProtocol) {
		self.repository = repository
	}

	func search(for city: String) async throws -> [CityEntity] {
		let result = try await repository.search(for: city)
		latestSearch = city
		return result
	}
}
