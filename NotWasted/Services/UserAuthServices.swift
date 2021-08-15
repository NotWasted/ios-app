//
//  UserAuthServices.swift
//  NotWasted
//
//  Created by admin on 30/06/21.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

/**
 {
    "email": "dummyuser@rit.edu",
    "password": "password"
 }
 */
struct LoginRequestBody: Codable {
    let email: String
    let password: String
}


/**
 {
     "id": "60e6566c6752c240e62e3766",
     "firstName": "Dummy",
     "lastName": "User",
     "email": "dummyuser@rit.edu",
     "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwZTY1NjZjNjc1MmMyNDBlNjJlMzc2NiIsImlhdCI6MTYyNTcwOTU5OCwiZXhwIjoxNjI2MzE0Mzk4fQ.zwXoYpTQ3EpuUmGd8Ie62P4JWhzUE07Tw-VT-CwFXpw",
     "message": "Sign-In Successful!"
 }
 */
struct LoginResponseBody: Codable {
    let id: String
    let firstName: String?
    let lastName: String?
    let email: String
    let accessToken: String?
    let message: String
}

/**
 {
     "firstName": "Dummy",
     "lastName": "User",
     "email": "dummyuser@rit.edu",
     "password": "password"
 }
 */
struct SignupRequestBody: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}

/**
{
    "_id": "60e6566c6752c240e62e3766",
    "firstName": "Dummy",
    "lastName": "User",
    "email": "dummyuser@rit.edu",
    "password": "$2b$12$XYSidvIZQilEOIWHmi1L8.a693DaijXwfyTogPoU76arA3cydS3Oi",
    "createdAt": "2021-07-08T01:35:40.968Z",
    "updatedAt": "2021-07-08T01:35:40.968Z",
    "__v": 0
}*/
struct SignupResponseBody: Codable {
    let id: String?
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let createdAt: String
    let updatedAt: String
    let vField: String
}

class UserAuthServices {
    
    func signin(email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://3.135.235.1/auth/signin") else {
            completion(.failure(.custom(errorMessage: "URL is not correct!")))
            return
        }
        
        let body = LoginRequestBody(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data!")))
                return
            }
            
            //try! JSONDecoder().decode(LoginResponseBody.self, from: data)
            
            //decoding our response...
            guard let loginResponse = try? JSONDecoder().decode(LoginResponseBody.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = loginResponse.accessToken else {
                completion(.failure(.invalidCredentials))
                return
            }
            // guard let statusCode
            completion(.success(token))
            
        }.resume()
    }
    
    
    func signup(firstName: String, lastName: String, email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/signup") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = SignupRequestBody(firstName: firstName, lastName: lastName, email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data!")))
                return
            }
            
            guard let signupResponse = try? JSONDecoder().decode(SignupResponseBody.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let userID = signupResponse.id else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(userID))
        }.resume()
    }
    
    func checkTokenValidity(token: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        guard let url = URL(string: "http://3.135.235.1/auth/checkValidToken") else {
            completion(.failure(.custom(errorMessage: "URL is not correct!")))
            return
        }
        
        //let body = TokenValidityBody()
    }
    
    func signout() {
        
    }
}
