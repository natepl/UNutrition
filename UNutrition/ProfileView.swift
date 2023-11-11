//
//  ProfileView.swift
//  UNutrition
//
//  Created by Nathaniel Parry Luff on 11/11/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack{
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 30, height:30)
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.name)
                                .font(.title3)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text(user.email)
                                .accentColor(.black)
                        }
                        .padding()
                    }
                    
                    
                }
                
                Section("General"){
                    Button{
                        viewModel.signOut()
                    }label: {
                        SettingsRowView(imageName: "arrow.right", title: "Sign Out", tintColor: .red)
                    }
                    Button{
                        
                    }label: {
                        SettingsRowView(imageName: "xmark", title: "Delete Account", tintColor: .red)
                    }
                }
            }
            
        }
    }
}

#Preview {
    ProfileView()
}
