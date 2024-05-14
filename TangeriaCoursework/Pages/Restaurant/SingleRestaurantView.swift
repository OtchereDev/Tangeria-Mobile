//
//  SingleRestaurantView.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 13/05/2024.
//

import SwiftUI


struct MenuItem: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let category: String
    let description: String
    let price: String
}

struct Restaurant: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let price: String
    let cuisine: String
}


let featuredItems = [
    MenuItem(imageName: "food1", name: "Cookie Sandwich", category: "$$ · Chinese", description: "", price: ""),
    MenuItem(imageName: "food2", name: "Chow Fun", category: "$$ · Chinese", description: "", price: ""),
    MenuItem(imageName: "food3", name: "Dim Sum", category: "$$ · Chinese", description: "", price: ""),
    // Add more featured items as needed
]

let mostPopularItems = [
    MenuItem(imageName: "food1", name: "Cookie Sandwich", category: "$$ · Chinese", description: "Shortbread, chocolate turtle cookies, and red velvet.", price: "AUD$10"),
    MenuItem(imageName: "food2", name: "Combo Burger", category: "$$ · Chinese", description: "Shortbread, chocolate turtle cookies, and red velvet.", price: "AUD$10"),
    MenuItem(imageName: "food3", name: "Combo Sandwich", category: "$$ · Chinese", description: "Shortbread, chocolate turtle cookies, and red velvet.", price: "AUD$10"),
]

struct RestaurantCard: View {
    var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(restaurant.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(10)
            
            Text(restaurant.name)
                .font(.custom("Poppins-Bold", size: 40))
                .padding(.top, 8)
            
            HStack {
                Text(restaurant.price)
                Text("·")
                Text(restaurant.cuisine)
            }
            .font(.subheadline)
            .foregroundColor(.gray)
        }
    }
}

let seafoodItems = [
    MenuItem(imageName: "food1", name: "Oyster Dish", category: "$$ · Chinese", description: "Shortbread, chocolate turtle cookies, and red velvet.", price: "AUD$10"),
    MenuItem(imageName: "food2", name: "Oyster On Ice", category: "$$ · Chinese", description: "Shortbread, chocolate turtle cookies, and red velvet.", price: "AUD$10"),
    MenuItem(imageName: "food3", name: "Fried Rice on Pot", category: "$$ · Chinese", description: "Shortbread, chocolate turtle cookies, and red velvet.", price: "AUD$10"),
    // Add more seafood items as needed
]


struct FeaturedItemCard: View {
    var item: MenuItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 100)
                .clipped()
                .cornerRadius(10)
            
            Text(item.name)
                .font(.headline)
            
            Text(item.category)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 150)
    }
}

struct MenuItemRow: View {
    var item: MenuItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(item.name)
                    .font(.headline)
                
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    Text(item.price)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(item.category)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.vertical)
    }
}

struct SingleRestaurantView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Restaurant Header
                   
                        Image("Header-image")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 250)
                            .clipped()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Mayfield Bakery & Cafe")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                            
                            Text("$$ · Chinese · American · Deshi food")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            HStack {
                                Text("4.3")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("200+ Ratings")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        //.background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                        .padding()
                    
                    
                    // Delivery Info
                    HStack {
                        HStack {
                            Image(systemName: "dollarsign.circle")
                                .foregroundColor(.orange)
                            VStack(alignment: .leading) {
                                Text("Free")
                                    .font(.headline)
                                Text("Delivery")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "clock")
                                .foregroundColor(.orange)
                            VStack(alignment: .leading) {
                                Text("25")
                                    .font(.headline)
                                Text("Minutes")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Take away action
                        }) {
                            Text("TAKE AWAY")
                                .font(.headline)
                                .foregroundColor(.orange)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.orange, lineWidth: 2))
                        }
                    }
                    .padding()
                    
                    // Featured Items
                    Text("Featured Items")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding([.leading, .top])
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(featuredItems) { item in
                                FeaturedItemCard(item: item)
                            }
                        }
                        .padding()
                    }
                    
                    // Most Populars
                    Text("Most Populars")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding([.leading, .top])
                    
                    ForEach(mostPopularItems) { item in
                        MenuItemRow(item: item)
                            .padding(.horizontal)
                    }
                    
                    // Sea Foods
                    Text("Sea Foods")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding([.leading, .top])
                    
                    ForEach(seafoodItems) { item in
                        MenuItemRow(item: item)
                            .padding(.horizontal)
                    }
                }
                .navigationBarTitle("")
                .navigationBarItems(leading: Button(action: {
                    // Back action
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }, trailing: HStack {
                    Button(action: {
                        // Share action
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.black)
                    }
                    Button(action: {
                        // Search action
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                    }
                })
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    SingleRestaurantView()
}
