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

		mapView.delegate = self

		mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "QuakeView")

		fetchQuakes()
	}

	func fetchQuakes() {
		quakeFetcher.fetchQuakes { (quakes, error) in
			if let error = error {
				NSLog("There was an error: \(error)")
				return
			}

			if let quakes = quakes {
				print(quakes)
				DispatchQueue.main.async {

					// region of interest
					if let firstQuake = quakes.first {
						let span = MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
						let region = MKCoordinateRegion(center: firstQuake.coordinate, span: span)
						self.mapView.setRegion(region, animated: true)
					}

					self.mapView.addAnnotations(quakes)
				}
			}
		}
	}
}

extension EarthquakesViewController: MKMapViewDelegate {
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		guard let quake = annotation as? Quake else { return nil }

		let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "QuakeView") as? MKMarkerAnnotationView
		annotationView?.glyphImage = #imageLiteral(resourceName: "QuakeIcon")

		switch quake.mag {
		case 5...:
			annotationView?.markerTintColor = .red
		case 3...5:
			annotationView?.markerTintColor = .orange
		default:
			annotationView?.markerTintColor = .yellow
		}

		return annotationView
	}
}
