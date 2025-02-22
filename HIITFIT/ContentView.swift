
//  ContentView.swift
//  HIITFIT

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 9
    @State private var history = HistoryStore()  // Must be @State

    var body: some View {
        TabView(selection: $selectedTab) {
            WelcomeView(selectedTab: $selectedTab, history: $history)  // Pass $history
                .tag(9)
            
            ForEach(Exercise.exercises.indices, id: \.self) { index in
                ExerciseView(selectedTab: $selectedTab, history: $history, index: index)  // Swap index & history
                    .tag(index)
            }
        }
        .tabViewStyle(.automatic)
    }
}

#Preview {
    ContentView()
        .previewDevice("iPhone 14 Pro")
}

