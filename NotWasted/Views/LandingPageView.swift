//
//  LandingPageView.swift
//  NotWasted
//
//  Created by admin on 16/07/21.
//

import SwiftUI

struct LandingPageView: View {
    @State var isAuthenticated: Bool = !UserDefaults.standard.bool(forKey: "isAuthenticated")
    
    var body: some View {
        //UserDefaults.standard.setValue(true, forKey: "isAuthenticated")
        if isAuthenticated {
            HomeView()
        } else {
            //LoginView(isAuthenticated: $isAuthenticated)
            LoginView()
        }
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
