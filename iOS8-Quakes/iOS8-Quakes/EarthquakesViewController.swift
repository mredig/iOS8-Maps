//
//  EarthquakesViewController.swift
//  iOS8-Quakes
//
//  Created by Michael Redig on 10/3/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit
import MapKit

class EarthquakesViewController: UIViewController {
	let quakeFetcher = QuakeFetcher()

	@IBOutlet var mapView: MKMapView!

	override func viewDidLoad() {
		super.viewDidLoad()

		
	}
}
