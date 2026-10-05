//
//  CityMapper.swift
//  Weather
//
//  Created by mango on 10/5/26.
//

import Foundation
protocol CityMapperProtocol {
	func map(dto: SearchCityDTO) -> CityEntity
}


struct CityMapper: CityMapperProtocol {
	func map(dto: SearchCityDTO) -> CityEntity {
		return CityEntity(
			name: dto.name,
			country: dto.country,
			latitude: dto.latitude,
			longitude: dto.longitude,
			population: dto.population
		)
	}
}
