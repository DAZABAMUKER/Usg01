//
//  MainView.swift
//  Usg01
//
//  Created by 안병욱 on 2023/03/03.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ChairListView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("store")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            LIkedView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Like")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
