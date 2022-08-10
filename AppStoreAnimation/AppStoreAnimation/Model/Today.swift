//
//  Today.swift
//  AppStoreAnimation
//
//  Created by Nasim Ahmed on 10.08.22.
//

import SwiftUI

//MARK

struct Today: Identifiable{
    var id = UUID().uuidString
    var appName: String
    var appDescription: String
    var appLogo: String
    var bannerTitle: String
    var platformTitle: String
    var artWork: String
}

var todayItems: [Today] = [
    Today(appName: "Super Mario", appDescription: "Help Mario win all the levels", appLogo: "Logo1", bannerTitle: "Overcome the obstables", platformTitle: "Apple Arcade", artWork: "post1"),
    Today(appName: "Forza Horizon", appDescription: "Rcing Game", appLogo: "Logo2", bannerTitle: "You're in charge of the Horizon festival", platformTitle: "Apple Arcade", artWork: "post2")
]
