//
//  FilterView.swift
//  TangeriaCoursework
//
//  Created by Bismark Amo on 13/05/2024.
//

import SwiftUI

struct FiltersView: View {
    @State private var selectedCategory: String? = "BURGERS"
    @State private var selectedDietary: String? = "ANY"
    @State private var selectedPriceRange: String? = "$$"
    
    let categories = ["ALL", "BRUNCH", "DINNER", "BURGERS", "CHINESE", "PIZZA", "SALADS", "SOUPS", "BREAKFAST"]
    let dietaryOptions = ["ANY", "VEGETARIAN", "VEGAN", "GLUTEN-FREE"]
    let priceRanges = ["$", "$$", "$$$", "$$$$", "$$$$$"]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Categories
                        HStack {
                            Text("CATEGORIES")
                                .font(.headline)
                            Spacer()
                            Button(action: {
                                selectedCategory = nil
                            }) {
                                Text("CLEAR ALL")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                        
                        WrapView(data: categories, selected: $selectedCategory)
                        
                        // Dietary
                        HStack {
                            Text("DIETARY")
                                .font(.headline)
                            Spacer()
                            Button(action: {
                                selectedDietary = nil
                            }) {
                                Text("CLEAR ALL")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                        
                        WrapView(data: dietaryOptions, selected: $selectedDietary)
                        
                        // Price Range
                        HStack {
                            Text("PRICE RANGE")
                                .font(.headline)
                            Spacer()
                            Button(action: {
                                selectedPriceRange = nil
                            }) {
                                Text("CLEAR ALL")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            ForEach(priceRanges, id: \.self) { price in
                                PriceRangeButton(price: price, selected: $selectedPriceRange)
                            }
                        }
                        .padding(.horizontal)
                        
                    }
                }
                
                // Apply Filters Button
                Button(action: {
                    // Apply filters action
                }) {
                    Text("APPLY FILTERS")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationBarTitle("Filters")
            .navigationBarItems(leading: Button(action: {
                // Back action
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
        }
    }
}

struct WrapView: View {
    var data: [String]
    @Binding var selected: String?
    
    var body: some View {
        VStack {
            let rows = Array(repeating: GridItem(.flexible(), spacing: 10), count: data.count / 3)
            LazyVGrid(columns: rows, spacing: 10) {
                ForEach(data, id: \.self) { item in
                    Button(action: {
                        selected = item
                    }) {
                        Text(item)
                            .font(.subheadline)
                            .foregroundColor(selected == item ? .white : .gray)
                            .padding()
                            .background(selected == item ? Color.orange : Color(.systemGray6))
                            .cornerRadius(8)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct PriceRangeButton: View {
    var price: String
    @Binding var selected: String?
    
    var body: some View {
        Button(action: {
            selected = price
        }) {
            Text(price)
                .font(.subheadline)
                .foregroundColor(selected == price ? .white : .gray)
                .padding()
                .background(selected == price ? Color.orange : Color(.systemGray6))
                .cornerRadius(8)
        }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}

