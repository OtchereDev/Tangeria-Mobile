//
//  HomePage.swift
//  TangeriaCoursework
//
//  Created by Bismark Amo on 13/05/2024.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    HStack{
                        Text("DELIVERY TO")
                            .foregroundColor(.orange)
                            .font(.system(size: 12))
                            .fontWeight(.thin)
                    }
                    HStack{
                        Spacer()
                        Text("HayStreet, Perth")
                            .font(.title3)
                            .fontWeight(.thin)
                            .padding(.leading, 40)
                        Image(systemName: "chevron.down")
                        
                        Spacer()
                        NavigationLink(destination: FiltersView()
                            .navigationBarBackButtonHidden()
                            
                        ) {
                            Text("Filter")
                                .font(.system(size: 16))
                                .fontWeight(.light)
                                .foregroundColor(.black)
                        }
                        
                        
                        
                        
                    }
                }
                .padding(.horizontal, 20)
                Divider()
                
                ScrollView(showsIndicators: false){
                    VStack{
                        
                        
                        HStack{
                            Image("image")
                                .resizable()
                                .scaledToFit()
                            
                        }
                        
                        HStack{
                            Text("Featured Partners")
                                .font(.title)
                                .frame(maxWidth: 150)
                                .padding(.leading, -15)
                                .padding(.bottom, -10)
                            
                            Spacer()
                            Text("See all")
                                .foregroundColor(.orange)
                            
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0..<10) {_ in
                                    //Text("Item \($0)")
                                    VStack{
                                        Image("BG")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 240, height: 200)
                                        
                                        HStack{
                                            VStack(alignment: .leading){
                                                Text("Krispy Creme ")
                                                    .font(.title)
                                                    .fontWeight(.ultraLight)
                                                Text("St Georgece Terrace, Perth")
                                                    .font(.headline)
                                                    .fontWeight(.light)
                                                    .frame(maxWidth: 240)
                                                    .padding([.top, .bottom], 0)
                                                    .padding(.leading, -18)
                                                HStack{
                                                    Text("4.5")
                                                        .padding(5)
                                                        .frame(width: 45)
                                                        .background(.orange)
                                                        .foregroundColor(.white)
                                                        .fontWeight(.bold)
                                                        .cornerRadius(7)
                                                        .font(.system(size: 15))
                                                    Spacer()
                                                    Text("25min")
                                                    Spacer()
                                                    Image(systemName: "circle.fill")
                                                        .font(.system(size: 6))
                                                        .padding([.leading, .trailing], -10)
                                                    Text("Free delivery")
                                                        .padding([.leading], -8)
                                                }
                                                .font(.system(size: 17))
                                                .fontWeight(.ultraLight)
                                                .padding([.top], 0.3)
                                                
                                            }
                                            .frame(alignment: .leading)
                                        }
                                    }
                                }
                            }
                            .padding([ .trailing, .leading])
                        }
                        .padding([.trailing, .leading], -16)
                        
                        ZStack{
                            Image("Banner1")
                                .resizable()
                                .scaledToFit()
                            VStack(alignment: .leading){
                                Text("Free Delivery for 1 Month!")
                                    .fontWeight(.bold)
                                    .lineSpacing(5)
                                    .font(.title)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(width: 250, height: 60, alignment: .leading)
                                    .padding([.top, .bottom])
                                
                                Text("You've to order at least $10 for using free delivery for 1 month")
                                    .lineSpacing(10)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(width:250, height: 60, alignment: .leading)
                                
                            }
                            .padding([.leading], -50)
                        }
                        .padding([.top, .bottom], 25)
                        
                        HStack{
                            Text("All Resturants")
                                .font(.title)
                                .frame(maxWidth: 200)
                                .padding(.leading, -15)
                            Spacer()
                            Text("See all")
                                .foregroundColor(.orange)
                        }
                        
                        HStack{
                            VStack(alignment: .leading){
                                Image("resturant1")
                                    .resizable()
                                    .scaledToFit()
                                Text("Mcdonald's")
                                    .font(.system(size: 33))
                                    .fontWeight(.ultraLight)
                                HStack{
                                    Text("$$ ")
                                    Spacer()
                                    Image(systemName: "circle.fill")
                                        .font(.system(size: 6))
                                        .foregroundColor(Color.gray)
                                        .padding([.leading, .trailing], 0)
                                    Text("Chinese")
                                        .padding([.leading], 4)
                                        .fontWeight(.light)
                                    Spacer()
                                    Image(systemName: "circle.fill")
                                        .font(.system(size: 6))
                                        .foregroundColor(Color.gray)
                                        .padding([.leading, .trailing], 0)
                                    Text("American")
                                        .padding([.leading], 4)
                                        .fontWeight(.light)
                                    Spacer()
                                    Image(systemName: "circle.fill")
                                        .font(.system(size: 6))
                                        .foregroundColor(Color.gray)
                                        .padding([.leading, .trailing], 0)
                                    Text("Deshi food")
                                        .padding([.leading], 4)
                                        .fontWeight(.light)
                                }
                                .frame(maxWidth: 330)
                                .padding([.top, .bottom], 1)
                                
                                HStack{
                                    Text(" 4.3 ")
                                    Spacer()
                                    Image("Star")
                                        .font(.system(size: 6))
                                        .foregroundColor(Color.gray)
                                        .padding([.leading, .trailing], 0)
                                    Text("200+ Ratings")
                                    Spacer()
                                    Image("timer")
                                    Text("25 mins")
                                    Spacer()
                                    Image("Dollar")
                                    Text("Free ")
                                }
                                .frame(maxWidth: 330)
                                .padding(.leading, -5)
                                
                            }
                            .padding([.bottom, .top], 25)
                        }
                        
                        
                        // Button("Filter")
                        
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .clipped()
              
            }
        }
        .navigationTitle("Home")
    }
}

#Preview {
    HomePage()
}
