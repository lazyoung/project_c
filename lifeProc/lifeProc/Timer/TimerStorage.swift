import Foundation
import SwiftUI

struct TimerStorage: Equatable {
    
    var workSeconds: Int
    var shortRelaxSeconds: Int
    var longRelaxSeconds: Int
    var numOfSections: Int
    let oneSectionTotalSeconds: Int
    let storage: [Int]
    
    init(workSeconds: Int = 5, shortRelaxSeconds: Int = 2, longRelaxSeconds: Int = 3, numOfSections: Int = 2) {
        
        self.workSeconds = workSeconds
        self.shortRelaxSeconds = shortRelaxSeconds
        self.longRelaxSeconds = longRelaxSeconds
        self.numOfSections = numOfSections
        self.oneSectionTotalSeconds = workSeconds + shortRelaxSeconds
        
        storage = [workSeconds, shortRelaxSeconds, longRelaxSeconds, numOfSections]
    }
}
