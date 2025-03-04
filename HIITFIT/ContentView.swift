
//  ContentView.swift
//  HIITFIT

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedTab") private var selectedTab = 9
    @StateObject private var historyStore = HistoryStore() 

    var body: some View {
        TabView(selection: $selectedTab) {
            WelcomeView(selectedTab: $selectedTab)
                .tag(9)

            ForEach(Exercise.exercises.indices, id: \.self) { index in
                ExerciseView(selectedTab: $selectedTab, index: index)
                    .tag(index)
            }
        }
        .environmentObject(historyStore)
        .tabViewStyle(.automatic)
        .onAppear {
            print(URL.documentsDirectory)
        }
    }
}

#Preview {
    ContentView()
}



//history view is not working as intended looking at text book, exercises datas are not being stored and showed, history is just empty. 
