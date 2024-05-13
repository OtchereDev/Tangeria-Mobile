//
//  SearchItem.swift
//  TangeriaCoursework
//
//  Created by Bismark Amo on 13/05/2024.
//

import SwiftUI

struct SearchItemView: View {
    var body: some View {
        VStack {
            Image("bgsp")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 15)
                .cornerRadius(10)
            
            VStack(alignment: .leading){
                Text("Mcdonald's")
                    .font(.title3)
                    .fontWeight(.ultraLight)
                HStack{
                    Text("$10")
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
            .padding(.leading, 0)
            
            HStack{
                
            }
        }
        .frame(maxWidth: 190)
    }
}

