import SwiftUI

struct TaskRow: View {
    @State var task: TaskItem
    @ObservedObject var taskManager: TaskManager
    var taskIndex: Int

    var body: some View {
        HStack {
            Image(systemName: task.symbol())
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .foregroundStyle(Color(task.color().rgbaColor))
            Spacer()

            Stepper {
                HStack {
                    Text(" \(taskManager.coin(index: taskIndex))")
                        .foregroundStyle(Color(task.color().rgbaColor))
                        .font(.title2)
                }
            } onIncrement: {
                task.score += 1
                taskManager.add(index: taskIndex)
            } onDecrement: {
                task.score -= 1
                taskManager.sub(index: taskIndex)
            }
            .padding()
        }
    }
}

