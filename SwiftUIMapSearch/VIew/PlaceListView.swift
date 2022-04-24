//
//  PlaceListView.swift
//  SwiftUIMapSearch
//
//  Created by Nazar Babyak on 24.04.2022.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    
    let landmarks: [LandMark]
    var onTap: () -> ()
    @Namespace var namespace
    @State private var change: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image(systemName: "chevron.up.circle")
                    .foregroundColor(.black.opacity(0.85))
                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                    .padding(25)
                    .background(.ultraThinMaterial)
                    .cornerRadius(50)
                    .gesture(TapGesture()
                                .onEnded(self.onTap)
                    )
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .trailing)
            .frame(height: .infinity)
            .padding()
          //.background(.ultraThinMaterial)
            .cornerRadius(5)
            
            List {
                
                ForEach(self.landmarks, id: \.id) { landmark in
                    
                    VStack(alignment: .leading) {
                        Text(landmark.name)
                            .font(.system(size: 20, weight: .semibold, design: .monospaced))
                            .foregroundColor(.black)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: UIScreen.main.bounds.width / 1.4, height: 1)
                            .foregroundColor(.secondary)
                        
                        Text(landmark.title)
                            .font(.system(size: 15, weight: .light, design: .monospaced))
                            .foregroundColor(.secondary)
                        
                    }
                }
            }
            .ignoresSafeArea()
            .matchedGeometryEffect(id: "TAG", in: namespace)
            .animation(.easeInOut)
            .listStyle(.sidebar)
            
        }.cornerRadius(10)
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [LandMark(placemark: MKPlacemark())], onTap: {})
    }
}
