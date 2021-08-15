//
//  CameraView.swift
//  NotWasted
//
//  Created by admin on 22/06/21.
//

import SwiftUI
import Foundation
import Combine

struct CameraView: View {
    var body: some View {
        
        ZStack {
            
            // This is our Camera Preview
            Color.black
                .ignoresSafeArea(.all, edges: .all)
        }
        
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
