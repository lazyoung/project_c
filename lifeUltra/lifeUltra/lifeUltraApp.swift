//
//  lifeUltraApp.swift
//  lifeUltra
//
//  Created by 金刚榕树 on 2023/12/16.
//

import SwiftUI

@main
struct lifeUltraApp: App {    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: CoinItem.self)
        }
    }
}
