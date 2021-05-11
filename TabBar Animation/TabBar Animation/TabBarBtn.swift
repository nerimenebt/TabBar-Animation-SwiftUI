//
//  TabBarBtn.swift
//  TabBar Animation
//
//  Created by Nerimene on 9/5/2021.
//

import SwiftUI

struct TabbarButton: View {
    public var image: String
    public var selectedTabBar: String
    public var reader: GeometryProxy
    public var xOffSet: CGFloat = 0
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(selectedTabBar == image ? Color.blue : Color.gray)
                .padding(selectedTabBar == image ? 15 : 0)
                .background(Color.white.opacity(selectedTabBar == image ? 1 : 0)
                .clipShape(Circle()))
                .offset(x: selectedTabBar == image ? (reader.frame(in: .global).minX-reader.frame(in: .global).midX) : 0, y: selectedTabBar == image ? -50 : 0)
        }
    }
}
