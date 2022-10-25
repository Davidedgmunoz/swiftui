//
//  MovieTicketsApp.swift
//  MovieTickets
//
//  Created by David Muñoz on 23/10/2022.
//

import SwiftUI

@main
struct MovieTicketsApp: App {
    @StateObject var viewRouter = ViewRouter()

    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
        }
    }
}
