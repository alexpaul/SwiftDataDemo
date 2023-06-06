//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by Alex Paul on 6/5/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
