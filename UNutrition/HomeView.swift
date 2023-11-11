//
//  HomeView.swift
//  UNutrition
//
//  Created by Nathaniel Parry Luff on 11/11/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthModel
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationStack {
            VStack{
                
                HStack{
                    HStack {
                        Text("Welcome,")
                        Text(user.name)
                    }
                    .padding(.horizontal, 30)
                    Spacer()
                        NavigationLink {
                            ProfileView()
                        } label: {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.top, 50)
                Spacer()
                
                NavigationLink{
                    SurveyView()
                } label: {
                    Text("Take the Survey")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
