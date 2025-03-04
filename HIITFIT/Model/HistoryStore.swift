import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

class HistoryStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []
    @Published var exerciseHistory: [String] = [] 

    init() {
        #if DEBUG
        print("Initializing HistoryStore")
        #endif
    }

    func addDoneExercise(_ exerciseName: String) {
        exerciseHistory.append(exerciseName)

        let today = Date()

        if let firstDate = exerciseDays.first?.date,
           Calendar.current.isDate(today, inSameDayAs: firstDate) {
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            let newDay = ExerciseDay(date: today, exercises: [exerciseName])
            exerciseDays.append(newDay)
        }

        print("History: ", exerciseDays)
    }
}

