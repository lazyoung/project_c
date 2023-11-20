import Foundation
import SwiftUI

// TODO: extend to a standalone coins manage class
class TimerManager: ObservableObject {
    
    @Published var isWorking = true
    @Published var isOnLongRelax = false
    @Published var timerStart = false
    @Published var completedSection = 0
    @Published var multiplierInfo: [Any] = [false, 2]
    @Published var storage: TimerStorage = TimerStorage()
    @Published var currentTo: CGFloat = 1
    @Published var currentMinute: Int = 1
    @Published var currentColor: Color = Color.blue
    @Published var currentText: String = "Tap to Start"
    @Published var coins = 0

    func timerFired() {

        // Sections
        if completedSection < storage.storage[3] {
            
            // There are unfinished section
            
            if storage.workSeconds != 0 {
                // Working
                
                // Working session initialization
                if storage.workSeconds == storage.storage[0] {
                    currentText = "Work"
                    currentTo = 1
                    currentColor = Color.blue
                    currentMinute = storage.workSeconds
                }
                
                storage.workSeconds -= 1
                currentMinute = storage.workSeconds
                self.currentTo -= CGFloat( 1 / Double(storage.storage[0]))
                
                // Working session ends, play done sound and add coin
                if storage.workSeconds == 0 {
                    self.addcoin(amount: 20)
                }
                
                
            } else if storage.workSeconds == 0 && storage.shortRelaxSeconds != 0 {
                // Short relaxing
                
                // Relaxing session initialization
                if storage.shortRelaxSeconds == storage.storage[1] {
                    currentText = "Short Break"
                    currentTo = 1
                    currentColor = Color.green
                    currentMinute = storage.shortRelaxSeconds
                }
                
                storage.shortRelaxSeconds -= 1
                currentMinute = storage.shortRelaxSeconds
                self.currentTo -= CGFloat( 1 / Double(storage.storage[1]))
                
                // Short relax session ends, play done sound and add coin
                if storage.shortRelaxSeconds == 0 {
                    self.addcoin(amount: 5)
                }
                
            } else if storage.shortRelaxSeconds == 0 {
                // This section has ended!
                completedSection += 1
                
                if completedSection != storage.storage[3] {
                    storage.workSeconds = storage.storage[0]
                    storage.shortRelaxSeconds = storage.storage[1]
                    currentColor = Color.blue
                    currentText = "Work"
                    
                } else if completedSection == storage.storage[3] {
                    currentColor = Color.orange
                    currentText = "Long Break"
                }
                currentTo = 1
            }
            
            // Long relaxing
            
        } else if completedSection == storage.storage[3] && storage.longRelaxSeconds != 0 {
            // Long relaxing initialization
            if storage.longRelaxSeconds == storage.storage[2] {
                currentText = "Long Break"
                currentTo = 1
                currentColor = Color.orange
                currentMinute = storage.longRelaxSeconds
            }
            
            storage.longRelaxSeconds -= 1
            currentMinute = storage.longRelaxSeconds
            self.currentTo -= CGFloat( 1 / Double(storage.storage[2]))
            
            // Long relax ends, play done sound and add coin
            if storage.longRelaxSeconds == 0 {
                self.addcoin(amount: 10)
            }
            
        } else if storage.longRelaxSeconds == 0 {
            // The project has ended, reset
            resetTimer()
        }
    }
    
    func resetTimer() {
        
        if (storage.workSeconds == storage.storage[0]) && (multiplierInfo[0] as! Bool == true) {
            // Do Nothing, the boost purchased is still effective
        } else {
            multiplierInfo = [false, 2]
        }
        
        self.timerStart = false
        completedSection = 0
        currentTo = 1
        storage.workSeconds = storage.storage[0]
        storage.shortRelaxSeconds = storage.storage[1]
        storage.longRelaxSeconds = storage.storage[2]
        currentMinute = storage.workSeconds
        currentColor = Color.blue
        currentText = "Tap to Start"
    }
    
    func addcoin(amount: Int) {
        if self.multiplierInfo[0] as! Bool == true {
            self.coins += (amount * (self.multiplierInfo[1] as! Int))
            
        } else {
            self.coins += amount
        }
    }
    
}
