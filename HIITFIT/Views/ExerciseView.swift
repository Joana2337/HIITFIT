
//  ExerciseView.swift
//  fitness track (chapt 2)


import SwiftUI
import AVKit

struct ExerciseView: View {
    @Binding var selectedTab: Int
    @EnvironmentObject var history: HistoryStore 
    let index: Int

    @State private var showHistory = false
    @State private var showSuccess = false
    @State private var timerDone = false
    @State private var showTimer = false

    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }

    // ✅ Fixed `exercise` scope issue
    var exercise: Exercise {
        Exercise.exercises[index] // Ensure `Exercise.swift` is included in your project
    }

    var startButton: some View {
        Button("Start Exercise") {
            showTimer.toggle()
        }
    }

    var doneButton: some View {
        Button("Done") {
            history.addDoneExercise(exercise.exerciseName)
            timerDone = false
            showTimer.toggle()
            if lastExercise {
                showSuccess.toggle()
            } else {
                selectedTab += 1
            }
        }
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)

                if let url = Bundle.main.url(forResource: exercise.videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn't find \(exercise.videoName).mp4")
                        .foregroundColor(.red)
                }

                HStack(spacing: 150) {
                    startButton
                    doneButton
                        .disabled(!timerDone)
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.medium, .large])
                        }
                }
                .font(.title3)
                .padding()

                if showTimer {
                    TimerView(timerDone: $timerDone, size: geometry.size.height * 0.07)
                }

                Spacer()

                RatingView(exerciseIndex: index)
                    .padding()

                Button("History") {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                        .environmentObject(history)
                }
            }
            .padding(.bottom)
        }
    }
}



//#Preview {
//    ExerciseView(selectedTab: .constant(0), index: 0)
//        .environmentObject(HistoryStore())
//}
