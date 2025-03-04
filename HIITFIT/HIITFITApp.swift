//
//  HIITFITApp.swift
//  HIITFIT
//
//  Created by Joanne on 2/12/25.
//

import SwiftUI

@main
struct HIITFITApp: App {
    @StateObject private var history = HistoryStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(history)
        }
    }
}
