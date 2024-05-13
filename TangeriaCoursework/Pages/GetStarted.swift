//
//  GetStarted.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 09/05/2024.
//

import SwiftUI

struct GetStarted: View {
    @State private var isNavigating = false
   
    var body: some View {
        NavigationStack{
            ZStack {
                Image("circle")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .offset(x: -70, y: -300)
                VStack{
                    Spacer().frame(height: 50)
                    HStack{
                        Image("logo")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                            .frame(width: 100, height: 100)
                        Text("Tamang FoodService").font(Font.custom("Poppins-Bold", size: 30)) .multilineTextAlignment(.center) .padding()
                    }.padding(.bottom, 30)
                    
                    Image("started")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .frame(width: 213, height: 243)
                    
                    Text("Welcome").font(Font.custom("Poppins-Bold", size: 45)).padding(.bottom, 10)
                    Text("It’s a pleasure to meet you. We are excited that you’re here so let’s get started!").multilineTextAlignment(.center)
                    Spacer()
                    
                    
                    Button(action: {
                                       // Button action
                        self.isNavigating = true

                                   }) {
                                       Text("Get Started")
                                           .foregroundColor(.white)
                                           .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                           .padding()
                                           .frame(maxWidth: .infinity)
                                           .background(Color(hex: "#eea734"))
                                           .cornerRadius(10) // Optionally add corner radius
                                   }
                                   .padding(.horizontal)
                    
                    NavigationLink(destination: Onboarding().navigationBarBackButtonHidden(true), isActive: $isNavigating) {
                                        EmptyView()
                                    }
                    
                    Spacer().frame(height: 10)
                       
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white.opacity(0.5))
               
            }
            .padding()
        }
        
    }    }


#Preview {
    GetStarted()
}
