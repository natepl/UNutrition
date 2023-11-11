//
//  UNutritionApp.swift
//  UNutrition
//
//  Created by Nathaniel Parry Luff on 11/10/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import RealmSwift

let realmApp = RealmSwift.App(id: "unutrition-qwdxo")

@main
struct UNutritionApp: SwiftUI.App {
    @StateObject var viewModel = AuthModel()
    @StateObject var surveyModel = SurveyModel()
    
    init() {
        FirebaseApp.configure()
    }
   
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(surveyModel)
        }
    }
}
