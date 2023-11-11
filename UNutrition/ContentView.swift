//
//  ContentView.swift
//  UNutrition
//
//  Created by Nathaniel Parry Luff on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthModel
    @EnvironmentObject var surveyModel: SurveyModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
