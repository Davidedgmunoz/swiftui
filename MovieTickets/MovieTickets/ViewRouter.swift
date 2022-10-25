//
//  ViewRouter.swift
//  MovieTickets
//
//  Created by David Muñoz on 23/10/2022.
//

import Foundation

class ViewRouter: ObservableObject, Hashable {
    static func == (lhs: ViewRouter, rhs: ViewRouter) -> Bool {
        lhs.currentPage == rhs.currentPage
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(currentPage)
    }
    
    @Published var currentPage: Page = .home

}

enum Page: String, Hashable, CaseIterable {
    case home = "homekit"
    case liked = "heart"
    case plus = "plus"
    case records = "waveform"
    case user = "person.crop.circle"
 }
