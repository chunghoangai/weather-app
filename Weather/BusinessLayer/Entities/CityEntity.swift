import Foundation

struct CityEntity: Equatable {
	let name: String
	let country: String
	let latitude: Double
	let longitude: Double
	let population: Int
	let region: String = "N/A"
	let isCapital: Bool = false
	
}
