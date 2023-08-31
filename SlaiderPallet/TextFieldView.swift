//
//  TextFieldView.swift
//  SlaiderPallet
//
//  Created by Vlad on 30.8.23..
//


import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    @Binding var value: Double
    @State private var showAlert = false
    let color: Color
    
    var body: some View {
        TextField("key", text: $text)
            .padding(.leading, 12.0)
            .frame(width: 50, height: 30, alignment: .trailing)
            .border(.secondary)
            .shadow(color: color, radius: 15, x: -20, y: 7)
            .foregroundColor(color)
            .onChange(of: text) { newValue in
                withAnimation {
                    check(newValue)
                }
            }
            .alert("Incorrect Value", isPresented: $showAlert, actions: {}) {
                Text("Enter value from 0 to 255")
            }
    }
}

extension TextFieldView {
    private func check(_ textValue: String) {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0
        text = "0"
    }
}

struct SliderValue_Previews: PreviewProvider {
    static var previews: some View {

        TextFieldView(text: .constant("128"), value: .constant(128.0), color: .green)
        
    }
}

