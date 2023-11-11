//
//  SurveyQuestionView.swift
//  UNutrition
//
//  Created by Nathaniel Parry Luff on 11/11/23.
//

import SwiftUI

struct SurveyQuestionView: View {
    @Binding var name: String
    let placeholder: String
    let defVal: Double
    
    let maxVal: Double
    let minVal: Double
    var body: some View {
        VStack{
            Text("What's your " + placeholder + " goal?")
            HStack{
                TextField(String(defVal), text: $name)
                    .font(.system(size:14))
            }
        }
        
    }
}

#Preview {
    SurveyQuestionView(name: .constant(""), placeholder: "missing", defVal: 0.0, maxVal: 0.0, minVal: 0.0)
}
