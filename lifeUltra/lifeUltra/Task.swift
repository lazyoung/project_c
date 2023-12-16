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
        TaskItem(category: "sleep", title: "Sleep"),
        TaskItem(category: "diet", title: "Diet"),
        TaskItem(category: "work", title: "Work"),
        TaskItem(category: "sport", title: "Sport"),
        TaskItem(category: "read", title: "Read"),
        TaskItem(category: "mood", title: "Mood"),
        TaskItem(category: "social", title: "Social"),
        TaskItem(category: "finace", title: "Finace"),
        TaskItem(category: "interest", title: "Interest")
    ]
}

