//
//  SurveyModel.swift
//  UNutrition
//
//  Created by Nathaniel Parry Luff on 11/11/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseCore
import FirebaseFirestore


class SurveyModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    let db = Firestore.firestore()
    init(){
        self.userSession = Auth.auth().currentUser
    }

    
    func createPreferences(id: String, calories: Double, protein: Double, carbohydrates: Double, sodium: Double, fats: Double, cholesterol: Double, allergens: [String]) async throws{
        
        do {
            let _: Void = try await
            db.collection("userSurveyData").document(id).setData([
                "calories": calories,
                "protein": protein,
                "carbohydrates": carbohydrates,
                "sodium": sodium,
                "fats": fats,
                "cholesterol": cholesterol,
                "allergens": allergens
            ])
        } catch {
            print("Failed to set preferences")
        }
    }
    
}
