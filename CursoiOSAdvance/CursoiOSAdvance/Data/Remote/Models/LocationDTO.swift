//
//  LocationDTO.swift
//  CursoiOSAdvance
//
//  Created by Dev2 on 04/10/2019.
//  Copyright © 2019 Raul Martin. All rights reserved.
//

import Foundation

struct LocationDTO: Codable {
    let street: StreetDTO?
    let city: String?
    let state: String?
    let country: String?
    let postcode: Int?
    let coodinates: CoordinatesDTO
    let timezone: TimezoneDTO?
}
