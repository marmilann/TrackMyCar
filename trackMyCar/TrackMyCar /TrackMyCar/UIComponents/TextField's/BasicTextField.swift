//
//  BasicTextField.swift
//  TrackMyCar
//
//  Created by Nariman Vildanov on 12.04.2023.
//

import SwiftUI

struct BasicTextField: ViewModifier {
    private let height: CGFloat = 54
    private let cornerRadius = SpaceNumber.x2
    private var strokeColor: Color {
        if fieldStatus == .error {
            return .red
        }
        return isFocused ? .white : .white.opacity(0.25)
    }
    var isFocused: Bool
    var fieldStatus: FieldValidation = .none
    
    func body(content: Content) -> some View {
        HStack(spacing: .zero) {
            content
                .modifier(Footnote())
                .foregroundColor(.white)
                .padding(.horizontal, SpaceNumber.x4)
                .frame(height: height)
                .padding(.trailing, SpaceNumber.x10)
            Spacer()
        }
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(strokeColor, lineWidth: 1)
        )
    }
}
