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
    var total: Int = 0
    
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
    
    func sum() {
        self.total = sleep + diet + work + sport + read + mood + social + finace + interest
    }
}

@Model
class TimerCoin {
    var sections: Int
    var total: Int = 0
    
    init(sections: Int = 1) {
        self.sections = sections
    }
    
    func sum() {
        self.total = sections * 25 + 10
    }
}

@Model
class Coins {
    var date: Date
    var task: TaskCoin
    var timer: TimerCoin
    var daily: Int
    
    init(task: TaskCoin, timer: TimerCoin) {
        self.date = Date.now
        self.task = task
        self.timer = timer
        self.daily = task.total + timer.total
    }
}
