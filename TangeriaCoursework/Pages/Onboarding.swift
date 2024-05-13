//
//  Onboarding.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 09/05/2024.
//

import SwiftUI

struct OnBoardingStep{
    let image: String
    let title: String
    let description: String
}



private let onboardingSteps = [
    OnBoardingStep(image:"step1", title:"All your favorites", description:"Order from the best local restaurants with easy, on-demand delivery."),
    OnBoardingStep(image:"step2", title:"Free delivery offers", description:"Free delivery for new customers via Apple Pay and others payment methods."),
    OnBoardingStep(image:"step3", title:"Choose your food", description:"Easily find your type of food craving and you’ll get delivery in wide range."),
]

struct Onboarding: View {
    @State private var currentStep = 0
    @State private var isNavigating = false
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        self.currentStep = onboardingSteps.count-1
                    }){
                        Text("Skip").padding(16).font(.system(size: 15)).fontWeight(.medium).foregroundColor(.gray)
                    }
                }
             
                HStack{
                    Image("logo")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .frame(width: 100, height: 100)
                    Text("Tamang FoodService").font(Font.custom("Poppins-Bold", size: 30)) .multilineTextAlignment(.center) .padding()
                }.padding(.bottom, 30)
                
                TabView(selection: $currentStep){
                    ForEach(0..<onboardingSteps.count){
                        it in
                        VStack{
                            Image(onboardingSteps[it].image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .imageScale(.large)
                                .foregroundStyle(.tint)
                                
                                .frame(width: 350, height: 350).padding(.bottom, 10)
                            
                            Text(onboardingSteps[it].title).font(Font.custom("Poppins-Bold", size: 30)).padding(.all, 20).multilineTextAlignment(.center)
                            ScrollView {
                                Text(onboardingSteps[it].description)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 20)
                            }
                            
                        }.tag(it)
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack{
                    ForEach(0..<onboardingSteps.count){
                        it in
                        if it == currentStep{
                            Rectangle().frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(Color(hex:"#22A45D"))
                        }else{
                            Circle().frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                        }
                    }
                }.padding(.bottom, 24)
                
                Button(action: {
                    if self.currentStep < onboardingSteps.count - 1 {
                        self.currentStep += 1
                    }else{
                        self.isNavigating = true
                    }
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
                
                
                
                Spacer().frame(height: 10)

            
                NavigationLink(destination: SignIn().navigationBarBackButtonHidden(false).navigationTitle("Sign In"), isActive: $isNavigating) {
                                EmptyView()
                        }
        }
       
        }
           
        }
       
    }


#Preview {
    Onboarding()
}
