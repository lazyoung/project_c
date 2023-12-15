//
//  Event.swift
//  lifeProc
//
//  Created by 金刚榕树 on 2023/12/15.
//

import Foundation

struct TaskItem: Identifiable, Hashable, Codable {
    var id = UUID()
    var category: String = ""
    var color: RGBAColor = ColorOptions.random().rgbaColor
    var title: String = "Untitled"
    var date = Date.now
    var score: Int = 0
    
    private var symbolNames : [String: String] = [
        "sleep": "bed.double.circle",
        "diet": "fork.knife.circle",
        "work": "briefcase.circle",
        "sport": "figure.run.circle",
        "read": "book.circle",
        "mood": "face.smiling",
        "social": "person.2.circle",
        "finace": "yensign.circle",
        "interest": "trophy.circle"
    ]
    
    func symbol() -> String { symbolNames[category] ?? "xmark.circle" }

    static var basicItems: [TaskItem] = [
        TaskItem(category: "sleep", title: "Daily Sleep"),
        TaskItem(category: "diet", title: "Daily Diet"),
        TaskItem(category: "work", title: "Daily Work"),
        TaskItem(category: "sport", title: "Daily Sport"),
        TaskItem(category: "read", title: "Daily Read"),
        TaskItem(category: "mood", title: "Daily Mood"),
        TaskItem(category: "social", title: "Daily Social"),
        TaskItem(category: "finace", title: "Daily Finace"),
        TaskItem(category: "interest", title: "Daily Interest")
    ]
}

