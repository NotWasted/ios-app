//
//  LoginViewModel.swift
//  NotWasted
//
//  Created by admin on 30/06/21.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    var email: String = ""
    var password: String = ""
    @Published var isAuthenticated: Bool = false
    // publishing variable
    @Published var authenticationComplete: Int? = 0
    
    func signIn() {
        self.authenticationComplete = 1
        let defaults = UserDefaults.standard
        
        UserAuthServices().signin(email: email, password: password) { result in
            switch result {
            // accept result as well as status code
            case .success(let token):
                print(token)
                defaults.setValue(token, forKey: "jsonwebtoken")
                defaults.setValue(true, forKey: "isAuthenticated")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                    self.authenticationComplete = 2
                }
            case.failure(let error):
                //defaults.setValue(true, forKey: "isAuthenticated")
                
                DispatchQueue.main.async {
                    self.isAuthenticated = false
                    self.authenticationComplete = 3
                }
                print(error.localizedDescription)
            }
        }
    }
    
    func signOut() {
        //UserAuthServices()
        let defaults = UserDefaults.standard
        
        defaults.setValue("", forKey: "jsonwebtoken")
        defaults.setValue(false, forKey: "isAuthenticated")
    }
}
