//
//  RegistrationView.swift
//  UNutrition
//
//  Created by Nathaniel Parry Luff on 11/11/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var name = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthModel
    
    var body: some View {
        VStack{
            VStack(spacing: 24){
                ZStack(alignment: .trailing){
                    InputView(text: $email, title: "Email Address", placeHolder: "email@example.com")
                        .autocapitalization(.none)
                    if !email.isEmpty {
                        if email.contains("@umass.edu") {
                            Image(systemName: "checkmark")
                        } else {
                            Image(systemName: "xmark")
                                .foregroundColor(.red)
                        }
                    }
                }
                InputView(text: $name, title: "Name", placeHolder: "Enter your name")
                    .autocapitalization(.none)
                InputView(text: $password, title: "Password", placeHolder: "", isSecureField: true)
                InputView(text: $confirmPassword, title: "Confirm Password", placeHolder: "", isSecureField: true)
            }
            .padding(.horizontal)
            Button{
                Task{
                    try await viewModel.createUser(withEmail: email, password: password, name: name)
                }
            }label:{
                HStack{
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 20)
            .disabled(!validForm)
            .opacity(validForm ? 1.0 : 0.25)
            
            Button {
                dismiss()
            } label: {
                HStack{
                    Text("Already have an account?")
                }
            }
            .padding(.top, 50)
            
        }
        
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var validForm: Bool {
        return !email.isEmpty && !password.isEmpty && password.count > 8 && email.contains("@umass.edu") && !name.isEmpty && confirmPassword == password
    }
}

#Preview {
    RegistrationView()
}
