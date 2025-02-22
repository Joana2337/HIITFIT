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

//Creating an array of exercie intances.
extension Exercise {
    static let exercises = [
        Exercise (
            exerciseName: ExerciseEnum.squat.rawValue,
            videoName: "Squat" // Matches "Squat.mp4"
        ),
        Exercise (
            exerciseName: ExerciseEnum.stepUp.rawValue,
            videoName: "Step-ups" // Matches "Step-ups.mp4"
        ),
        Exercise (
            exerciseName: ExerciseEnum.burpee.rawValue,
            videoName: "Burpee" // Matches "Burpee.mp4"
        ),
        Exercise(
            exerciseName: ExerciseEnum.sunSalute.rawValue,
            videoName: "Sun Salutes" // Matches "Sun Salutes.mp4"
        )
    ]
}
