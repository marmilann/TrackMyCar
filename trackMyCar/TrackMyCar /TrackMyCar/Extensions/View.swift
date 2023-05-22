//
//  View.swift
//  TrackMyCar
//
//  Created by Nariman Vildanov on 12.04.2023.
//

import SwiftUI
import UIKit

// MARK: - Placeholder

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

