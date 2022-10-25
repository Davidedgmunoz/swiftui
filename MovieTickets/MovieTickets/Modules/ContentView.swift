//
//  ContentView.swift
//  MovieTickets
//
//  Created by David Muñoz on 23/10/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
    @Namespace var animation

    var body: some View {
        VStack {
            Spacer()
            TabView(selection: $viewRouter.currentPage) {
                HomeView()
                    .tag(Page.home)
                
                Text("Fav")
                    .tag(Page.liked)

                Text("Plus")
                    .tag(Page.plus)

                Text("Record")
                    .tag(Page.records)

                Text("User")
                    .tag(Page.user)

            }.toolbar(.hidden, for: .bottomBar)
            tabBar()
        }
    }
    
    @ViewBuilder
    func tabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(Page.allCases, id: \.rawValue) { tab in
                TabBarIcon(
                    viewRouter: viewRouter, namespace: animation,
                    assignedPage: tab, tabName: tab.rawValue
                )
            }
        }
        .padding(.horizontal, 15)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color("TabFirst"), Color("TabSecond"), Color("TabThird")]),
                startPoint: .leading, endPoint: .trailing
            )
        ).background(.ultraThinMaterial)
        .animation(
            .interactiveSpring(
                response: 0.5, dampingFraction: 0.65, blendDuration: 0.65
            ), value: viewRouter.currentPage
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: .init())
    }
}
