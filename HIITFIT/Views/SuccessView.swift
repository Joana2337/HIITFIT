
//  SuccessView.swift
//  HIITFIT

import SwiftUI

struct SuccessView: View {
    //data representation. declears dependency on some shared data - thus data that is visible to all views in a sub-tree of the app. 
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTab: Int
    
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Image(systemName: "hand.raised.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
                    .foregroundColor(.purple)
                
                Text("High Five!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("""
                Good job completing all four exercises!
                Remember tomorrow's another day.
                So eat well and get some rest.
                """)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            }
            
            VStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Button("Continue"){
                        selectedTab = 9
                        dismiss()
                    }

                }

            }
        }
    }
}

#Preview {
    SuccessView(selectedTab: .constant(3))
        .presentationDetents([.medium, .large])
}
