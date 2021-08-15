//
//  RegistrationViewModel.swift
//  NotWasted
//
//  Created by admin on 16/07/21.
//

import Foundation


class RegistrationViewModel: ObservableObject {
    
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var password: String = ""
    var repassword: String = ""
    
    @Published var isRegistered: Bool = false
    
    func register() {
        
        let defaults = UserDefaults.standard
        
        UserAuthServices().signup(firstName: firstName, lastName: lastName, email: email, password: password) { result in
            switch result {
            case .success(let userId):
                print(userId)
                defaults.setValue(userId, forKey: "userId")
                DispatchQueue.main.async {
                    self.isRegistered = true
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
