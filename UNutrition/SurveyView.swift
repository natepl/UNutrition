//
//  SurveyView.swift
//  UNutrition
//
//  Created by Nathaniel Parry Luff on 11/11/23.
//

import SwiftUI

struct SurveyView: View {
    @State private var calories = ""
    @State private var protein = ""
    @State private var carbs = ""
    @State private var fats = ""
    @State private var cholesterol = ""
    @State private var sodium = ""
    @EnvironmentObject var viewModel: AuthModel
    @EnvironmentObject var surveyModel: SurveyModel
    @State private var allergens: [String] = []
    
    @State private var caloriesConverted = 0.0
    @State private var proteinConverted = 0.0
    @State private var carbsConverted = 0.0
    @State private var fatsConverted = 0.0
    @State private var cholesterolConverted = 0.0
    @State private var sodiumConverted = 0.0
    
        
    var validValues: Bool {
        if let value = calories.double {
        } else {
            return false
        }
        
        if let value = protein.double {
        } else {
            return false
        }
        
        if let value = fats.double {
        } else {
            return false
        }
        
        if let value = cholesterol.double {
        } else {
            return false
        }
        
        if let value = sodium.double {
        } else {
            return false
        }
        return true
    }
    
    var body: some View {
        if let user = viewModel.currentUser {
            ScrollView{
                VStack(spacing: 24){
                    SurveyQuestionView(name: $calories, placeholder: "calories", defVal: 2000.0, maxVal: 6000.0, minVal: 1000.0)
                    SurveyQuestionView(name: $protein, placeholder: "protein", defVal: 80.0, maxVal: 250.0, minVal: 30.0)
                    SurveyQuestionView(name: $carbs, placeholder: "carb", defVal: 275.0, maxVal: 600.0, minVal: 50.0)
                    SurveyQuestionView(name: $fats, placeholder: "fars", defVal: 65.0, maxVal: 120.0, minVal: 30.0)
                    SurveyQuestionView(name: $cholesterol, placeholder: "cholesterol", defVal: 150.0, maxVal: 400.0, minVal: 0.0)
                    SurveyQuestionView(name: $sodium, placeholder: "sodium", defVal: 1500.0, maxVal: 2600.0, minVal: 100.0)
                    
                    VStack{
                        Text("Dietary restrictions?")
                        HStack(spacing:10){
                            Button{
                                allergens.append("dairy")
                            } label: {
                                HStack{
                                    Text("Dairy")
                                }
                                .frame(width: 30, height: 20)
                            }
                            
                            Button{
                                allergens.append("gluten")
                            } label: {
                                HStack{
                                    Text("Gluten")
                                }
                                .frame(width: 30, height: 20)
                            }
                            
                            Button{
                                allergens.append("nuts")
                            } label: {
                                HStack{
                                    Text("Tree nuts (ex. Peanuts)")
                                }
                                .frame(width: 30, height: 20)
                            }
                            
                            Button{
                                allergens.append("soy")
                            } label: {
                                HStack{
                                    Text("Soy")
                                }
                                .frame(width: 30, height: 20)
                            }
                        }
                    }
                    
                    
                }
                .padding(.horizontal, 20)
                Button{
                    caloriesConverted = calories.double!
                    proteinConverted = protein.double!
                    carbsConverted = carbs.double!
                    sodiumConverted = sodium.double!
                    fatsConverted = fats.double!
                    cholesterolConverted = cholesterol.double!
                    
                    Task {
                        try await surveyModel.createPreferences(id: user.id,calories:caloriesConverted,protein:proteinConverted,carbohydrates:carbsConverted,sodium:sodiumConverted,fats:fatsConverted,cholesterol:cholesterolConverted,allergens:allergens)
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
                .disabled(!validValues)
                .opacity(validValues ? 1.0 : 0.25)
                
            }
        }
    }
}

extension StringProtocol{
    var double: Double? {return Double(self)}

}

#Preview {
    SurveyView()
}
