//
//  lifeUltraApp.swift
//  lifeUltra
//
//  Created by 金刚榕树 on 2023/12/16.
//

import SwiftUI

@main
struct lifeUltraApp: App {
    @Environment(\.modelContext) private var dataContext
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
