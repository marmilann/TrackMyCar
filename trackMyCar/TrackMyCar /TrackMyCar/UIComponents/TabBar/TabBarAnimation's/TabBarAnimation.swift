//
//  TabBarAnimation.swift
//  TrackMyCar
//
//  Created by Nariman Vildanov on 12.04.2023.
//

import SwiftUI

struct TabBarItemAnimation: ViewModifier {
    @State private var scale: CGFloat = 1.0
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .onTapGesture {
                withAnimation(.spring()) {
                    self.scale = 0.8
                }
                withAnimation(.spring().delay(0.2)) {
                    self.scale = 1.0
                }
            }
    }
}
