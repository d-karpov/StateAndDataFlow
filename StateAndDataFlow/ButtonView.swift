//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Денис Карпов on 28.01.2022.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
        }
        .buttonStyle(color: .red)
    }
}

struct ButtonStyle: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.title.bold()).foregroundColor(.white)
            .frame(width: 200, height: 60)
            .background(color)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 4)
            )
    }
}


extension Button {
    func buttonStyle(color: Color) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: color))
    }
}
