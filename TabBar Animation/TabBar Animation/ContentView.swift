//
//  ContentView.swift
//  TabBar Animation
//
//  Created by Nerimene on 9/5/2021.
//

import SwiftUI

struct ContentView: View {
    
    let tabList: [String] = ["home", "placeholder", "shopping", "settings"]
    @State private var selectedTabBar = "home"
    @State public var xOffSet: CGFloat = 0
    init() { UITabBar.appearance().isHidden = true }
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTabBar) {
                if selectedTabBar == tabList[0] {
                    Color(red: 4/255, green: 139/255, blue: 154/255).ignoresSafeArea()
                } else if selectedTabBar == tabList[1] {
                    Color(red: 224/255, green: 205/255, blue: 169/255).ignoresSafeArea()
                } else if selectedTabBar == tabList[2] {
                    Color(red: 250/255, green: 128/255, blue: 114/255).ignoresSafeArea()
                } else {
                    Color(red: 212/255, green: 115/255, blue: 212/255).ignoresSafeArea()
                }
            }
            HStack() {
                ForEach(tabList,id: \.self) { image in
                    GeometryReader { reader in
                        TabbarButton(image: image, selectedTabBar:
                                        selectedTabBar, reader: reader) {
                            withAnimation(Animation.linear(duration: 0.3)) {
                                selectedTabBar = image
                                xOffSet = reader.frame(in: .global).minX
                            }
                        }
                        .onAppear(perform: {
                            if image == tabList.first {
                                xOffSet = reader.frame(in: .global).minX
                            }
                        })
                    }.frame(width: 30, height: 30)
                    if image != tabList.last { Spacer(minLength: 0) }
                }
            }
            .padding(.horizontal, 25).padding(.vertical)
            .background(Color.white.clipShape(CustomShape(xOffSet: xOffSet)).cornerRadius(10))
            .padding(.horizontal)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
