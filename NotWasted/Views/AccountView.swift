//
//  AccountView.swift
//  NotWasted
//
//  Created by admin on 29/06/21.
//

import SwiftUI

struct UpdateProfileView: View {
    var body: some View {
        //Text("Update Profile Info")
        NavigationView {
            Text("Update Profile Info")
                .navigationTitle("Update Profile")
        }
    }
}


struct AccountView: View {
    var body: some View {
        
        NavigationView {
            Text("AccountView")
            
        }.navigationTitle("Account")
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
