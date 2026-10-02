protocol SearchCityRepositoryProtocol {
	func search(for city: String) async throws-> [CityEntity]
}
