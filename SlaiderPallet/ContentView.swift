//
//  ContentView.swift
//  SlaiderPallet
//
//  Created by Vlad on 30.8.23..
//

import SwiftUI

struct ContentView: View {
    @State private var red = 45.0
    @State private var green = 125.0
    @State private var blue = 200.0
    
    @FocusState private var focusedTextField: Focus?
    
    var body: some View {
        
        VStack(spacing: 40) {
            ColorView(red: red, green: green, blue: blue)
            
            VStack {
                SliderView(value: $red, color: .red)
                    .focused($focusedTextField, equals: .red)
                SliderView(value: $green, color: .green)
                    .focused($focusedTextField, equals: .green)
                SliderView(value: $blue, color: .blue)
                    .focused($focusedTextField, equals: .blue)
            }
            .frame(height: 155)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") {
                        focusedTextField = nil
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}


extension ContentView {
    private enum Focus {
        case red
        case green
        case blue
    }
    
    private func previousField() {
        switch focusedTextField {
        case .red:
            focusedTextField = .blue
        case .green:
            focusedTextField = .red
        case .blue:
            focusedTextField = .green
        case .none:
            focusedTextField = nil
        }
    }
    
    private func nextField() {
        switch focusedTextField {
        case .red:
            focusedTextField = .green
        case .green:
            focusedTextField = .blue
        case .blue:
            focusedTextField = .red
        case .none:
            focusedTextField = nil
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
