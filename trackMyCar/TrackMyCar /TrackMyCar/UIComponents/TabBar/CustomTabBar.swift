//
//  CustomTabBar.swift
//  TrackMyCar
//
//  Created by Nariman Vildanov on 12.04.2023.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 80)
                .cornerRadius(40)
                .shadow(radius: 10)
                .padding(.horizontal)
            
            HStack(spacing: 30) {
                Button(action: {
                    // action for first tab
                }, label: {
                    VStack {
                        Image(systemName: "house.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                        Text("Home")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                })
                
                Button(action: {
                    // action for second tab
                }, label: {
                    VStack {
                        Image(systemName: "star.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                        Text("Favorites")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                })
                
                Button(action: {
                    // action for third tab
                }, label: {
                    VStack {
                        Image(systemName: "person.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                        Text("Profile")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                })
            }
            .padding(.top, 10)
            .padding(.horizontal)
        }
    }
}
