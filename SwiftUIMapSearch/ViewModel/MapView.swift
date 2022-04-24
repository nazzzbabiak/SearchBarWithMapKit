//
//  MapView.swift
//  SwiftUIMapSearch
//
//  Created by Nazar Babyak on 24.04.2022.
//

import SwiftUI
import Foundation
import MapKit

struct MapView: UIViewRepresentable {
    
    let landmarks: [LandMark]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        //
        updateAnnotations(from: uiView)
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.landmarks.map(LandMarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
    
}

