//
//  LoginView.swift
//  NotWasted
//
//  Created by admin on 30/06/21.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 300, height: 50, alignment: .center)
            .font(.system(size: 18))
            .background(Color.black)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct RegistrationView: View {
    @StateObject private var registrationVM = RegistrationViewModel()
    var body: some View {
        VStack {
            HStack {
                Text("Create an Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding()
                Spacer()
            }
            
            VStack {
                TextField("First Name", text: $registrationVM.firstName)
                    .padding()
                    .border(Color.gray, width: 1)
                    .clipShape(Capsule())
                
                TextField("Last Name", text: $registrationVM.lastName).padding()
                    .border(Color.gray, width: 1)
                    .clipShape(Capsule())
                
                TextField("Email", text: $registrationVM.email)
                    .padding()
                    .border(Color.gray, width: 1)
                    .clipShape(Capsule())
                
                SecureField("Password", text: $registrationVM.password).padding()
                    .border(Color.gray, width: 1)
                    .clipShape(Capsule())
                
                SecureField("Retype Password", text: $registrationVM.repassword).padding()
                    .border(Color.gray, width: 1)
                    .clipShape(Capsule())
                
                Spacer()
                
                Button("Register") {
                    registrationVM.register()
                }
                .buttonStyle(GrowingButton())
            }
        }
    }
}

struct LoginView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    @State private var showRegistrationPopover = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {

                    Text("Welcome to 0̷Wasted!").font(.largeTitle).fontWeight(.bold).multilineTextAlignment(.leading).padding()

                    Spacer()

                }
                
                HStack {
                    Text("Log In to get started")
                        .font(.subheadline)
                        .italic()
                        .padding()
                        .foregroundColor(Color.gray)

                    Spacer()
                }
                
                TextField("Email", text: $loginVM.email)
                    .padding()
                    .border(Color.gray, width: 1)
                    .clipShape(Capsule())

                SecureField("Password", text: $loginVM.password).padding()
                    .border(Color.gray, width: 1)
                    .clipShape(Capsule())


                Spacer()
                NavigationLink(
                    destination: HomeView(),
                    tag: 3,
                    selection: $loginVM.authenticationComplete) {
                    Button("Login") {
                        self.loginVM.authenticationComplete = 0
                        loginVM.signIn()
                    }
                }
                .buttonStyle(GrowingButton())
                
                if self.loginVM.authenticationComplete == 1 {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                
                if self.loginVM.authenticationComplete == 3 {
                    Text("Authentication Failed!")
                        .foregroundColor(Color.red)
                }
                
                Spacer()
                
                Button("Not Registered? Create an account here!"){
                    showRegistrationPopover = true
                }
                .font(.footnote)
                .foregroundColor(Color.gray)
                .sheet(isPresented: $showRegistrationPopover) {
                    RegistrationView()
                
                }
            }
        }
        .navigationBarTitle(Text("Login"))
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    //@State private var isAuthenticated: Bool = false
    static var previews: some View {
        LoginView()
    }
}
