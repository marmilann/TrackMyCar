//
//  TabBarSelectionAnimation.swift
//  TrackMyCar
//
//  Created by Nariman Vildanov on 12.04.2023.
//

import SwiftUI

struct TabBarSelectionAnimation: ViewModifier {
    @State private var opacity: Double = 1.0
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .onAppear {
                withAnimation(.linear(duration: 0.5)) {
                    self.opacity = 0.5
                }
            }
            .onDisappear {
                withAnimation(.linear(duration: 0.5)) {
                    self.opacity = 1.0
                }
            }
    }
}
