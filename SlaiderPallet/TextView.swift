//
//  TextView.swift
//  SlaiderPallet
//
//  Created by Vlad on 30.8.23..
//

import SwiftUI

struct TextView: View {
    var color: Color
    let value: Double
    
    var body: some View {
        Text(value.formatted())
            .frame(width: 35, alignment: .leading)
            .foregroundColor(color)
    }
}

struct SliderValueLabel_Previews: PreviewProvider {
    static var previews: some View {

            TextView(color: .black, value: 128)
        
    }
}
