//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Roman on 15/02/2025.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedIndex: Int = 0
    
    //    init() {
    //        let appearance = UITabBarAppearance()
    //        appearance.configureWithTransparentBackground()
    //        appearance.backgroundColor = UIColor.clear
    //        UITabBar.appearance().standardAppearance = appearance
    //    }
    
    //    var body: some View {
    //
    //        ZStack(alignment: .bottom) {
    //            TabView(selection: $selectedIndex) {
    //                MainCharactersView()
    //                    .tag(0)
    //
    //                FavoriteCharacterView()
    //                    .tag(1)
    //            }
    //            .tabViewStyle(.page)
    //
    //            ZStack {
    //                HStack {
    //                    ForEach(TabItems.allCases, id: \.self) { item in
    //                        Button {
    //                            selectedIndex = item.rawValue
    //                        } label: {
    //                            customTabItem(image: item.icon, isActive: (selectedIndex == item.rawValue))
    //                        }
    //                    }
    //                }
    //                .padding(10)
    //            }
    //            .frame(width: 182, height: 62)
    //            .background(.backgroundsBottomNavigation)
    //            .cornerRadius(40)
    //        }
    //    }
    //}
    //
    
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
        HStack(spacing: 40) {
            ForEach(TabItems.allCases, id: \.self) { item in
                Button {
                    selectedIndex = item.rawValue
                } label: {
                    customTabItem(image: item.icon, isActive: (selectedIndex == item.rawValue))
                }
            }
        }
        .frame(width: 182, height: 62)
        .background(.backgroundsBottomNavigation)
        .cornerRadius(40)
        .shadow(color: .shadowPrimary.opacity(0.16), radius: 16, y: 2)
    }
    
    func customTabItem(image: Image, isActive: Bool) -> some View {
        HStack() {
            image
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .accentPrimary : .iconsSecondary)
                .frame(width: 42, height: 42)
        }
    }
}
    
    

#Preview {
    TabBarView()
}
