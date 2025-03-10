
//  HistoryView.swift
//  HIITFIT

import SwiftUI

struct HistoryView: View {
    @Binding var showHistory: Bool
    @EnvironmentObject var history: HistoryStore 
    @State private var selectedTab = 9

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer() 
                    Button(action: { showHistory.toggle() }) {
                        Image(systemName: "xmark.circle")
                    }
                    .font(.title)
                    .padding()
                }
                
                HeaderView(selectedTab: $selectedTab, titleText: "History")
                
                Spacer()
            }

            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("History")
                            .font(.largeTitle)
                        Text("Your past workouts")
                            .font(.headline)
                    }
                }
            }
        }
    }
}

//#Preview {
////HistoryView(showHistory: .constant(true))
//       // .environmentObject(HistoryStore())
//}
