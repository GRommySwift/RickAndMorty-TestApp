//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Roman on 15/02/2025.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Group {
                    if selectedIndex == 0 {
                        MainCharactersView()
                    } else {
                        FavoriteCharacterView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                customTabBar
            }
        }
        .navigationViewStyle(.stack)
    }
}
    
extension TabBarView {
    
    var customTabBar: some View {
        HStack(spacing: TabBarConstants.spacing) {
            ForEach(TabItems.allCases, id: \.self) { item in
                Button {
                    selectedIndex = item.rawValue
                } label: {
                    customTabItem(image: item.icon, isActive: (selectedIndex == item.rawValue))
                }
            }
        }
        .frame(width: TabBarConstants.tabBarWidth, height: TabBarConstants.tabBarHeight)
        .background(.backgroundsBottomNavigation)
        .cornerRadius(TabBarConstants.tabBarCornerRadius)
        .shadow(
            color: .shadowPrimary.opacity(TabBarConstants.tabBarShadowOpacity),
            radius: TabBarConstants.tabBarShadowRadius,
            y: TabBarConstants.tabBarShadowOffsetY
        )
    }
    
    func customTabItem(image: Image, isActive: Bool) -> some View {
        HStack {
            image
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .accentPrimary : .iconsSecondary)
                .frame(width: TabBarConstants.iconSize, height: TabBarConstants.iconSize)
        }
    }
}
    
#Preview {
    TabBarView()
}
