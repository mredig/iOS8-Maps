//
//  QuakeData.swift
//  iOS8-QuakesTests
//
//  Created by Paul Solt on 10/3/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import Foundation

let quakeData =
###"""
{
    "type": "Feature",
    "properties": {
        "mag": 1.29,
        "place": "10km SSW of Idyllwild, CA",
        "time": 1388620296020,
        "updated": 1457728844428,
        "tz": -480,
        "url": "https://earthquake.usgs.gov/earthquakes/eventpage/ci11408890",
        "detail": "https://earthquake.usgs.gov/fdsnws/event/1/query?eventid=ci11408890&format=geojson",
        "felt": null,
        "cdi": null,
        "mmi": null,
        "alert": null,
        "status": "reviewed",
        "tsunami": 0,
        "sig": 26,
        "net": "ci",
        "code": "11408890",
        "ids": ",ci11408890,",
        "sources": ",ci,",
        "types": ",cap,focal-mechanism,general-link,geoserve,nearby-cities,origin,phase-data,scitech-link,",
        "nst": 39,
        "dmin": 0.067290000000000003,
        "rms": 0.089999999999999997,
        "gap": 51,
        "magType": "ml",
        "type": "earthquake",
        "title": "M 1.3 - 10km SSW of Idyllwild, CA"
    },
    "geometry": {
        "type": "Point",
        "coordinates": [
            -116.7776667,
            33.663333299999998,
            11.007999999999999
        ]
    },
    "id": "ci11408890"
}
"""###.data(using: .utf8)!

let geoJSONData =
###"""
{
    "type": "FeatureCollection",
    "metadata": {
        "generated": 1570119638000,
        "url": "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2014-01-01&endtime=2014-01-02",
        "title": "USGS Earthquakes",
        "status": 200,
        "api": "1.8.1",
        "count": 324
    },
    "features": [
        {
            "type": "Feature",
            "properties": {
                "mag": 1.29,
                "place": "10km SSW of Idyllwild, CA",
                "time": 1388620296020,
                "updated": 1457728844428,
                "tz": -480,
                "url": "https://earthquake.usgs.gov/earthquakes/eventpage/ci11408890",
                "detail": "https://earthquake.usgs.gov/fdsnws/event/1/query?eventid=ci11408890&format=geojson",
                "felt": null,
                "cdi": null,
                "mmi": null,
                "alert": null,
                "status": "reviewed",
                "tsunami": 0,
                "sig": 26,
                "net": "ci",
                "code": "11408890",
                "ids": ",ci11408890,",
                "sources": ",ci,",
                "types": ",cap,focal-mechanism,general-link,geoserve,nearby-cities,origin,phase-data,scitech-link,",
                "nst": 39,
                "dmin": 0.067290000000000003,
                "rms": 0.089999999999999997,
                "gap": 51,
                "magType": "ml",
                "type": "earthquake",
                "title": "M 1.3 - 10km SSW of Idyllwild, CA"
            },
            "geometry": {
                "type": "Point",
                "coordinates": [
                    -116.7776667,
                    33.663333299999998,
                    11.007999999999999
                ]
            },
            "id": "ci11408890"
        },
        {
            "type": "Feature",
            "properties": {
                "mag": 1.1000000000000001,
                "place": "117km NW of Talkeetna, Alaska",
                "time": 1388620046501,
                "updated": 1558392330681,
                "tz": -540,
                "url": "https://earthquake.usgs.gov/earthquakes/eventpage/ak01421ig3u",
                "detail": "https://earthquake.usgs.gov/fdsnws/event/1/query?eventid=ak01421ig3u&format=geojson",
                "felt": null,
                "cdi": null,
                "mmi": null,
                "alert": null,
                "status": "reviewed",
                "tsunami": 0,
                "sig": 19,
                "net": "ak",
                "code": "01421ig3u",
                "ids": ",ak10992887,ak01421ig3u,",
                "sources": ",ak,ak,",
                "types": ",associate,geoserve,nearby-cities,origin,phase-data,tectonic-summary,",
                "nst": null,
                "dmin": null,
                "rms": 0.56999999999999995,
                "gap": null,
                "magType": "ml",
                "type": "earthquake",
                "title": "M 1.1 - 117km NW of Talkeetna, Alaska"
            },
            "geometry": {
                "type": "Point",
                "coordinates": [
                    -151.64590000000001,
                    63.101999999999997,
                    14.1
                ]
            },
            "id": "ak01421ig3u"
        }
    ],
    "bbox": [
        -179.688,
        -56.1218,
        -2.884,
        167.8106,
        64.8102,
        582.05
    ]
}
"""###.data(using: .utf8)! // BUG: Autocomplete doesn't work
