//
//  LogDishView.swift
//  NotWasted
//
//  Created by admin on 29/06/21.
//

import SwiftUI

struct LogDishView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Eat something today? Log it in!")
                        .multilineTextAlignment(.leading)
                        .padding()
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    
                    VStack {
                        Image(systemName: "camera")
                        Text("Take a picture")
                            //.font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "speaker")
                        Text("Speech-to-Text")
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Image(systemName: "keyboard")
                        Text("Type it out")
                            //.font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "speaker")
                        Text("Speech-to-Text")
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            .navigationTitle("Logger")
        }
    }
}

struct LogDishView_Previews: PreviewProvider {
    static var previews: some View {
        LogDishView()
    }
}
