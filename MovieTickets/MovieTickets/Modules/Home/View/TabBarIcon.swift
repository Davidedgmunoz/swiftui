//
//  TabBarIconView.swift
//  MovieTickets
//
//  Created by David Muñoz on 25/10/2022.
//

import SwiftUI

struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    var namespace: Namespace.ID

    let assignedPage: Page
    let tabName: String

    var body: some View {
            Image(systemName: assignedPage.rawValue)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(
                    viewRouter.currentPage == assignedPage ? .white : .white.opacity(0.9)
                )
                .offset(y: viewRouter.currentPage == assignedPage ? -20 : 0)
                .scaleEffect(viewRouter.currentPage == assignedPage ? 1.5 : 1)
                .background(content: {
                    if viewRouter.currentPage == assignedPage {
                        Circle()
                            .strokeBorder(Color("Border"), lineWidth: 0.4)
                            .background(Circle().fill(.ultraThinMaterial))
                            .scaleEffect(2.7)
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 5, y: 10)
                            .offset(y: viewRouter.currentPage == assignedPage ? -30 : 0)
                            .matchedGeometryEffect(id: "TAB", in: namespace)
                    }
                })
                .frame(maxWidth: .infinity)
                .padding(.top, 15)
                .padding(.bottom, 10)
                .contentShape(Rectangle())
                .onTapGesture {
                    viewRouter.currentPage = assignedPage
                }
    }
}

struct TabBarIcon_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        TabBarIcon(
            viewRouter: .init(),
            namespace: namespace,
            assignedPage: .plus,
            tabName: Page.plus.rawValue
        ).background(.red)
    }
}
