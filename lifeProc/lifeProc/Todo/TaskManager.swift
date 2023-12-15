//
//  TaskManager.swift
//  lifeProc
//
//  Created by 金刚榕树 on 2023/12/16.
//

import Foundation

class TaskManager: ObservableObject {
    @Published var multiFactor: Int
    @Published var sum : Int = 0

    var storage : [Int]
    
    init(multiFactor: Int = 20, storage: [Int] = [2, 2, 2, 2, 2, 2, 2, 2, 2]) {
        self.multiFactor = multiFactor
        self.storage = storage
        
        for index in 0..<storage.count {
            sum += coin(index: index)
        }
    }

    func add(index: Int, value : Int = 1) {
        storage[index] += value
        sum += value * multiFactor
    }
    
    func sub(index: Int, value : Int = 1) {
        storage[index] -= value
        sum -= value * multiFactor
    }
    
    func coin(index: Int) -> Int {
        return storage[index] * multiFactor
    }
}
