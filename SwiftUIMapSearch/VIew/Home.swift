//
//  Home.swift
//  SwiftUIMapSearch
//
//  Created by Nazar Babyak on 24.04.2022.
//

import SwiftUI
import MapKit

struct Home: View {
    
    @ObservedObject var locationManager = LocationManager()
    @State private var landmarks: [LandMark] = [LandMark]()
    @State private var search: String = ""
    @State private var tapped: Bool = false
    
    private func getNearByLandmarks() {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    LandMark(placemark: $0.placemark)
                }
                
            }
            
        }
        
    }
    
    func calculateOffset() -> CGFloat {
        
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 5
        }
        else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            
            MapView(landmarks: landmarks)
            
            TextField("Search", text: $search, onEditingChanged: { _ in })
            {
                // commit
                self.getNearByLandmarks()
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .offset(y: 44)
            
            PlaceListView(landmarks: self.landmarks) {
                // on tap
                self.tapped.toggle()
            }.animation(.spring())
                .offset(y: calculateOffset())
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
