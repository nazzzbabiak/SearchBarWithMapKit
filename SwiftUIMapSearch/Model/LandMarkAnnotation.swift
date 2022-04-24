//
//  LandMarkAnnotation.swift
//  SwiftUIMapSearch
//
//  Created by Nazar Babyak on 24.04.2022.
//

import UIKit
import MapKit

final class LandMarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    
    init(landMark: LandMark) {
        self.title = landMark.name
        self.coordinate = landMark.coordinate
    }
}
