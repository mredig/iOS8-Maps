//
//  iOS8_QuakesTests.swift
//  iOS8-QuakesTests
//
//  Created by Michael Redig on 10/3/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import XCTest

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

class iOS8_QuakesTests: XCTestCase {

	func testQuakeJSON() throws {
		//arrange
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .millisecondsSince1970
		// api stores times in milliseconds
		let timestamp = Date(timeIntervalSince1970: 1388620296020 / 1000)

		//act
		let quakeSON = try decoder.decode(Quake.self, from: quakeData)

		//assert
		XCTAssertEqual(1.29, quakeSON.mag, accuracy: 0.001)
		XCTAssertEqual("10km SSW of Idyllwild, CA", quakeSON.place)
		XCTAssertEqual(-116.7776667, quakeSON.longitude, accuracy: 0.001)
		XCTAssertEqual(33.663333299999998, quakeSON.latitude, accuracy: 0.001)
		XCTAssertEqual(timestamp, quakeSON.time)
	}

	func testGeoJSONData() throws {
		//arrange
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .millisecondsSince1970
		// api stores times in milliseconds
		let timestamp = Date(timeIntervalSince1970: 1388620296020 / 1000)

		let quakeResults = try decoder.decode(QuakeResults.self, from: geoJSONData)

		let quakeSON = quakeResults.features[0]

		//assert
		XCTAssertEqual(1.29, quakeSON.mag, accuracy: 0.001)
		XCTAssertEqual("10km SSW of Idyllwild, CA", quakeSON.place)
		XCTAssertEqual(-116.7776667, quakeSON.longitude, accuracy: 0.001)
		XCTAssertEqual(33.663333299999998, quakeSON.latitude, accuracy: 0.001)
		XCTAssertEqual(timestamp, quakeSON.time)
	}
}
