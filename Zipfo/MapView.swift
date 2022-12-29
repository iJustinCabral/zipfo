//
//  MapView.swift
//  Zipfo
//
//  Created by Justin Cabral on 12/28/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let zipInfo: ZipInformation
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        Map(coordinateRegion: $mapRegion)
            .onAppear {
                let lat = Double(zipInfo.places[0].latitude)
                let long = Double(zipInfo.places[0].longitude)
                mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat!, longitude: long!), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            }
    }
}
