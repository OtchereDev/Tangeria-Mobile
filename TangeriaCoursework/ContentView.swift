//
//  ContentView.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 09/05/2024.
//

import SwiftUI


struct ContentView: View {

    var body: some View {
        Group{
            if(AuthenticationManager.shared.currentUser != nil){
                    HomeIndex()
               
            }else{
                GetStarted()
            }
        }
       
    }
    
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb & 0xFF0000) >> 16) / 255.0
        let g = Double((rgb & 0x00FF00) >> 8) / 255.0
        let b = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

