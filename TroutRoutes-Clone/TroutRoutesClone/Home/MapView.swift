//
//  MapView.swift
//  TroutRoutesClone
//
//  Created by Baber Farrukh on 3/11/25.
//


import SwiftUI
import MapboxMaps

struct MapView: View {
    var body: some View {
        let center = CLLocationCoordinate2D(latitude: 36.1716, longitude: -115.1391) // Las Vegas
        Map(initialViewport: .camera(center: center, zoom: 6, bearing: 0, pitch: 0))
    }
}
