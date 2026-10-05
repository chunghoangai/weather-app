//
//  SearchCityDTO.swift
//  Weather
//
//  Created by mango on 10/5/26.
//

struct SearchCityDTO: Decodable {
	let name: String
	let country: String
	let latitude: Double
	let longitude: Double
	let population: Int
}
