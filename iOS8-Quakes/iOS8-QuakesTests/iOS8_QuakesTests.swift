//
//  iOS8_QuakesTests.swift
//  iOS8-QuakesTests
//
//  Created by Michael Redig on 10/3/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import XCTest
@testable import iOS8_Quakes

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
