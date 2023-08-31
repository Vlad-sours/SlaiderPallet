//
//  SladerView.swift
//  SlaiderPallet
//
//  Created by Vlad on 30.8.23..
//

import SwiftUI

struct SliderView: View {
    
    @Binding var value: Double
    @State private var text = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            TextView(color: color, value: value)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
                .shadow(color:color, radius: 15, x: -15, y: 7)
                .onChange(of: value) { newValue in
                    text = value.formatted()
                }
            
            TextFieldView(text: $text, value: $value, color: color)
        }
        .onAppear {
            text = value.formatted()
        }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {

            SliderView(value: .constant(100), color: .red)
        
    }
}
