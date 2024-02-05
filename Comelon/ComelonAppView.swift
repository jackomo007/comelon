//
//  ContentView.swift
//  Comelon
//
//  Created by José Angel Prieto on 1/22/24.
//

import SwiftUI

struct ComelonAppView: View {
    var body: some View {
        TabView{
            ComelonListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }
        .accentColor(Color("brandPrimary"))
    }
}

#Preview {
    ComelonAppView()
}
