//
//  FoodView.swift
//  UNutrition
//
//  Created by Nathaniel Parry Luff on 11/11/23.
//

import SwiftUI

struct FoodView: View {
    @State private var searchText = ""
    let foods = ["General Tso's Chicken", "Chicken Alfredo", "Cookies"]
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) {food in
                    NavigationLink {
                        
                    } label: {
                        Text(food)
                    }
                }
            }
            LazyVStack(){
                ScrollView{
                    
                }
            }
        }
        .searchable(text:$searchText)
        var searchResults: [String] {
            if searchText.isEmpty{
                return foods
            } else {
                return foods.filter {$0.contains(searchText)}
            }
        }
    }
}

#Preview {
    FoodView()
}
