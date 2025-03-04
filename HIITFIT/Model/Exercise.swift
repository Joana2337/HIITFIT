//Enumeration chapt 3.

import Foundation

struct Exercise {
    let exerciseName: String
    let videoName: String

    enum ExerciseEnum: String {
        case squat = "Squats"
        case stepUp = "Step-ups"
        case burpee = "Burpee"
        case sunSalute = "Sun Salute"
    }
}


extension Exercise {
    static let exercises: [Exercise] = [
        Exercise(
            exerciseName: ExerciseEnum.squat.rawValue,
            videoName: "Squat"
        ),
        Exercise(
            exerciseName: ExerciseEnum.stepUp.rawValue,
            videoName: "Step-ups"
        ),
        Exercise(
            exerciseName: ExerciseEnum.burpee.rawValue,
            videoName: "Burpee"
        ),
        Exercise(
            exerciseName: ExerciseEnum.sunSalute.rawValue,
            videoName: "Sun Salutes" 
        )
    ]
}

