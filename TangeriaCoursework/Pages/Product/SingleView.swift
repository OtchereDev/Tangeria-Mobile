//
//  SingleView.swift
//  TangeriaCoursework
//
//  Created by Bismark Amo on 13/05/2024.
//

import SwiftUI

struct SingleResturant: View {
    var body: some View {
        GeometryReader{geometry in
            ScrollView{
                let componentWidth = geometry.size.width * 0.9;
                let componentHeight = geometry.size.height * 0.33;
                VStack{
                    ZStack{
                        Image("Header-image")
                            .resizable()
                            .frame(height: componentHeight)
                            .scaledToFit()
                        HStack(alignment: .top){
                            Image("back")
                                .scaledToFit()
                            Spacer()
                            Image("share")
                            Image("search")
                        }
                        .padding(.top, -90)
                        .padding([.leading, .trailing])
                    }
                    
                }
                
                VStack(alignment: .leading){
                    Text("Mayfield Bakery & Cafe")
                        .font(.title)
                        .frame(width: componentWidth)
                        .padding(.leading, -40)
                    HStack{
                        Text("$$ ")
                        Spacer()
                        Image(systemName: "circle.fill")
                            .font(.system(size: 6))
                            .foregroundColor(Color.gray)
                            .padding([.leading, .trailing], 0)
                        Text("Chinese")
                            .padding([.leading], 4)
                            .fontWeight(.ultraLight)
                        Spacer()
                        Image(systemName: "circle.fill")
                            .font(.system(size: 6))
                            .foregroundColor(Color.gray)
                            .padding([.leading, .trailing], 0)
                        Text("American")
                            .padding([.leading], 4)
                            .fontWeight(.ultraLight)
                        Spacer()
                        Image(systemName: "circle.fill")
                            .font(.system(size: 6))
                            .foregroundColor(Color.gray)
                            .padding([.leading, .trailing], 0)
                        Text("Deshi food")
                            .padding([.leading], 4)
                            .fontWeight(.ultraLight)
                    }
                    .frame(maxWidth: componentWidth)
                    .padding([.top, .bottom], -10)
                    .fontWeight(.ultraLight)
                    //.padding(.trailing, 30)
                    
                    HStack{
                        Text(" 4.3 ")
                        
                        Image("Star")
                            .font(.system(size: 6))
                            .foregroundColor(Color.gray)
                            .padding([.leading, .trailing], 10)
                        Text("200+ Ratings")
                        Spacer()
                        
                    }
                    .frame(maxWidth: 330)
                    .padding([ .top, .bottom], 14)
                    .padding(.leading, -5)
                    .fontWeight(.ultraLight)
                }
                .padding(.bottom, -10)
                
                HStack{
                    Group {
                        Image("delivery")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 35)
                            .padding([.trailing], -15)
                        VStack{
                            Text("Free")
                                .font(.title2)
                            Text("Delivery")
                                .fontWeight(.ultraLight)
                        }
                    }
                    
                    Group {
                        Image("clock")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 35)
                            .padding([.trailing], -20)
                            .padding(.bottom)
                        VStack{
                            Text("25")
                                .font(.title2)
                            Text("Minutes")
                                .fontWeight(.ultraLight)
                        }
                    }
                    Spacer()
                    Group{
                        Text("Take Away")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .foregroundColor(Color.yellow)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.yellow, lineWidth: 2)
                            )
                            .padding()
                    }
                        
                }
                .padding([ .leading, .trailing])
                
                HStack{
                    Text("Featured Items")
                        .font(.title)
                        .frame(maxWidth: 250)
                        .padding(.leading, -25)
                        .padding(.top, -20)
                        .padding(.bottom, -70)
                        
                    Spacer()
                        
                }
                .padding()
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: -35) {
                        ForEach(0..<10) {_ in
                            //Text("Item \($0)")
                            VStack{
                                Image("bgsp")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 190, height: 130)
                                    .cornerRadius(10)

                                VStack(alignment: .leading){
                                    Text("Mcdonald's")
                                        .font(.title3)
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
                                        Text(" ")

                                    }
                                    .frame(maxWidth: 180)
                                    .padding([.top, .bottom], -11)
                                }
                                .frame(alignment: .leading)
                                .padding()
                                .padding([.top], -20)
                                .padding(.leading, 10)

                                HStack{
                                    
                                }
                            }
                            .frame(maxWidth: 190)
                        }
                    }
                    .padding([ .trailing])
                }
                .padding()
                .padding([.trailing, .leading], -16)
                .padding(.bottom, -10)
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(0..<10) {_ in
                            //Text("Item \($0)")
                            Text("Seafood")
                                .font(.title)
                                .padding([.leading, .trailing], 10)
                                .foregroundColor(Color.gray)
                        }
                    }
                    .padding()
                    .padding([ .trailing])
                    .padding([.top], -5)
                }
                //.padding()
                
                HStack {
                    Text("Most Populars")
                        .font(.title)
                        .fontWeight(.ultraLight)
                        .padding(.leading)
                    Spacer()
                }
                .padding()
                
                ForEach(0..<3) {_ in
                    VStack(alignment: .leading){
                        HStack(alignment: .top){
                            Image("food")
                                .resizable()
                                .cornerRadius(15)
                                .scaledToFit()
                                .frame(maxWidth: 140)
                            VStack(alignment: .leading){
                                Text("Cookie Sandwich")
                                    .font(.system(size: 25))
                                    .fontWeight(.light)
                                    .foregroundColor(Color.gray)
                                Text("Shortbread, Chocolate turtle cookie and Red Velvet ")
                                    .foregroundColor(Color.gray)
                                    .lineSpacing(5)
                                    .padding([ .top, .bottom], 1)
                                HStack{
                                    Text("$60 ")
                                    //Spacer()
                                    Image(systemName: "circle.fill")
                                        .font(.system(size: 6))
                                        .foregroundColor(Color.gray)
                                        .padding([.leading, .trailing], 0)
                                    Text("Chinese")
                                        .padding([.leading], 4)
                                        .fontWeight(.light)
                                        .foregroundColor(Color.gray)
                                    Spacer()
                                    Text("£ 10")
                                        .foregroundColor(Color.yellow)
                                        .font(.title2)
                                        .padding(.trailing)
                                    
                                }
                            }
                        }
                        .padding([.leading, .trailing])
                    }
                    .padding([.top, .bottom])
                    //.border(width: 5, edge: [.bottom], color: .gray)
                }
                
            }
        }
    }
}

struct SingleResturant_Previews: PreviewProvider {
    static var previews: some View {
        SingleResturant()
    }
}
