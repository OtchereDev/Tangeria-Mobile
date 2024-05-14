//
//  SplashScreen.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 13/05/2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive{
            ContentView().font(.custom("Poppins-Regular", size: 16))
        }else{
            VStack{
                VStack{
                    Image("logo")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        
                    Text("Tangeria")
                        .font(Font.custom("Poppins-Bold", size: 30))
                        .foregroundColor(Color(hex:"#eea734"))
                        .opacity(0.8)
                }.scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    
                    withAnimation{
                        self.isActive = true
                    }
                    
                }
            }
        }
       
    }
}

#Preview {
    SplashScreen()
}
