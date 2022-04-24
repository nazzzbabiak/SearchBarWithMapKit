//
//  LandMark.swift
//  SwiftUIMapSearch
//
//  Created by Nazar Babyak on 24.04.2022.
//

import SwiftUI
import MapKit

struct LandMark {
    
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
    
}
