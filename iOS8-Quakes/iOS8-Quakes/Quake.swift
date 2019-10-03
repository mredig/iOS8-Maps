//
//  Quake.swift
//  iOS8-Quakes
//
//  Created by Michael Redig on 10/3/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import Foundation
import MapKit

class QuakeResults: Decodable {
	let features: [Quake]
}

class Quake: NSObject, Decodable {
	let mag: Double
	let place: String
	let time: Date
	let longitude: Double
	let latitude: Double

	enum QuakeKeys: String, CodingKey {
		case properties
		case geometry

		enum PropertiesKeys: String, CodingKey {
			case mag
			case place
			case time
		}

		enum GeographyKeys: String, CodingKey {
			case coordinates
		}
	}

	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: QuakeKeys.self)
		let propertiesContainer = try container.nestedContainer(keyedBy: QuakeKeys.PropertiesKeys.self, forKey: .properties)
		let geoContainer = try container.nestedContainer(keyedBy: QuakeKeys.GeographyKeys.self, forKey: .geometry)
		var coordinateContainer = try geoContainer.nestedUnkeyedContainer(forKey: .coordinates)

		self.mag = try propertiesContainer.decode(Double.self, forKey: .mag)
		self.place = try propertiesContainer.decode(String.self, forKey: .place)
		self.time = try propertiesContainer.decode(Date.self, forKey: .time)

		self.longitude = try coordinateContainer.decode(Double.self)
		self.latitude = try coordinateContainer.decode(Double.self)

		super.init()
	}
}

extension Quake: MKAnnotation {
	var title: String? {
		place
	}
	var subtitle: String? {
		"\(mag)"
	}
	var coordinate: CLLocationCoordinate2D {
		return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
}
