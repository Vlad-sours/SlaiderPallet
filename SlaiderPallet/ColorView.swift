//
//  ColorView.swift
//  SlaiderPallet
//
//  Created by Vlad on 30.8.23..
//

import SwiftUI

struct ColorView: View {
    
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red / 255, green: green / 255, blue: blue / 255)
            .cornerRadius(15)
            .frame(height: 130)
            .shadow(color: .black, radius: 15, x: -15, y: -8)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 3)
            )
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 1, green: 50, blue: 255)
    }
}

