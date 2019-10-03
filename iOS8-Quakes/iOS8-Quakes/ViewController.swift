//
//  ViewController.swift
//  iOS8-Quakes
//
//  Created by Michael Redig on 10/3/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		let fetcher = QuakeFetcher()

		fetcher.fetchQuakes { (quakes, error) in
			if let error = error {
				NSLog("FAILED: \(error)")
				return
			}

			if let quakes = quakes {
				print(quakes)
			}
		}
	}


}

