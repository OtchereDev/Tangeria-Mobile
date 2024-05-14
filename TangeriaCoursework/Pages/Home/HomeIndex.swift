//
//  HomeIndex.swift
//  TangeriaCoursework
//
//  Created by Bismark Amo on 13/05/2024.
//

import SwiftUI

struct HomeIndex: View {
    @State private var selection = 0
    var body: some View {
            TabView(selection: $selection) {
                HomePage()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(0)
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(1)
                
                OrdersView()
                    .tabItem {
                        Image(systemName: "square.and.arrow.down")
                        Text("Order")
                    }
                    .tag(2)
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(3)
            }
            .accentColor(.orange)
        }
}

#Preview {
    HomeIndex()
}
