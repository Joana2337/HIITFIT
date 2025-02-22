
import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

struct HistoryStore {
    var exerciseDays: [ExerciseDay] = []

    mutating func addDoneExercise(_ exerciseName: String) {
        let today = Date()
        if let index = exerciseDays.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: today) }) {
            exerciseDays[index].exercises.append(exerciseName)
        } else {
            let newDay = ExerciseDay(date: today, exercises: [exerciseName])
            exerciseDays.append(newDay)
        }
    }
}


