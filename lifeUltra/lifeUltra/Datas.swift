//
//  datas.swift
//  lifeUltra
//
//  Created by 金刚榕树 on 2023/12/20.
//

import Foundation
import SwiftData

@Model
class TaskCoin {
    var sleep: Int
    var diet: Int
    var work: Int
    var sport: Int
    var read: Int
    var mood: Int
    var social: Int
    var finace: Int
    var interest: Int
    var sum: Int = 0
    
    init(sleep: Int = 0, diet: Int = 0, work: Int = 0, sport: Int = 0, read: Int = 0, mood: Int = 0, social: Int = 0, finace: Int = 0, interest: Int = 0) {
        self.sleep = sleep
        self.diet = diet
        self.work = work
        self.sport = sport
        self.read = read
        self.mood = mood
        self.social = social
        self.finace = finace
        self.interest = interest
    }
    
    func save(storage: [Int]) {
        self.sleep = storage[0]
        self.diet = storage[1]
        self.work = storage[2]
        self.sport = storage[3]
        self.read = storage[4]
        self.mood = storage[5]
        self.social = storage[6]
        self.finace = storage[7]
        self.interest = storage[8]

        for task in storage {
            self.sum += task
        }
    }
}

@Model
class TimerCoin {
    var sections: Int
    var sum: Int = 0
    
    init(sections: Int = 1) {
        self.sections = sections
    }
    
    func save(sections: Int) {
        self.sum = sections * 25 + 10
    }
}

@Model
class CoinItem {
    @Attribute(.unique) var day: String
    var task: TaskCoin
    var timer: TimerCoin
    var sum: Int
    
    init(task: TaskCoin, timer: TimerCoin) {
        self.task = task
        self.timer = timer
        let df = DateFormatter()
        df.dateFormat = "yyyyMMddHHmmss"
        self.day = df.string(from: Date())
        
        self.sum = 0
    }
    
    func save() {
        self.sum = self.task.sum + self.timer.sum
    }
}
