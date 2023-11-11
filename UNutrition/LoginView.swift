//
//  LoginView.swift
//  UNutrition
//
//  Created by Nathaniel Parry Luff on 11/10/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthModel
    
    var body: some View {
        NavigationStack{
            Spacer()
            Text("UNutrition")
                .font(.title)
            Spacer()
            
            
            VStack(spacing: 24){
                InputView(text: $email, title: "UMass Email", placeHolder: "example@umass.edu")
                    .autocapitalization(.none)
                InputView(text: $password, title: "Password", placeHolder: "", isSecureField: true)
            }
            .padding(.horizontal)
            
            
            
            Button{
                Task {
                    try await viewModel.signIn(withEmail: email, password: password)
                }
            }label:{
                HStack{
                    Text("Sign in")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 20)
            .disabled(!validForm)
            .opacity(validForm ? 1.0 : 0.25)
            
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden()
            } label: {
                HStack{
                    Text("Don't have an account?")
                }
            }
            .padding(.top, 50)
            Spacer()

        }
        
        
    }
}

extension LoginView: AuthenticationFormProtocol {
    var validForm: Bool {
        return !email.isEmpty && !password.isEmpty && password.count > 8 && email.contains("@umass.edu")
    }
}

#Preview {
    LoginView()
}
