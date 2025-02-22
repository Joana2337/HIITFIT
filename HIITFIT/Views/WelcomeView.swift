
//  WelcomeView.swift
//  fitness track (chapt 2)

import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Int
    @Binding var history : HistoryStore
    @State private var showHistory = false
    var body: some View {
        VStack {
            HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
            
            Spacer()
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Get fit")
                        .font(.largeTitle)
                    Text("with high intensity interval training")
                        .font(.headline)
                }
                Image("step-up")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 240, height: 240)
                    .clipShape(Circle())
            }

      
            Button(action: { selectedTab = 0 }) {
                Label("Get Started", systemImage: "arrow.right.circle")
            }
            .font(.title2)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 2)
            )

            Spacer()
            
            Button("History"){
                showHistory.toggle()
            }
            .sheet(isPresented: $showHistory){
                HistoryView(showHistory: $showHistory, history: $history)
            }
        }
    }
}
//
//#Preview {
//    WelcomeView(selectedTab: .constant(9))
//}
