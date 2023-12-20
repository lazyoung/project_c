import SwiftUI

struct TaskView : View {
    
    @ObservedObject var taskManager:TaskManager

    var body: some View {
        ScrollView(content: {
            ForEach(0 ..< TaskItem.basicItems.count, id: \.self) { index in
                TaskRow(task: TaskItem.basicItems[index], taskManager: taskManager, taskIndex: index)
            }
        })
    }
}
