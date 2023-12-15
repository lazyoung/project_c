import SwiftUI

struct TaskRow: View {
    @State var task: TaskItem
    @ObservedObject var taskManager: TaskManager
    var taskIndex: Int

    var body: some View {
        HStack {
            Label {
                HStack {
                    Text(task.title)
                        .font(.title2)
                }
            }
            icon: {
                Image(systemName: task.symbol())
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color(task.color))
            }
            .scaledToFit()
            .padding()
            
            Spacer()

            Stepper {
                HStack {
                    Spacer()
                    Text(" \(taskManager.coin(index: taskIndex))")
                        .font(.largeTitle)
                        .foregroundStyle(Color(task.color))
                        .frame(alignment: .trailing)
                }
            } onIncrement: {
                task.score += 1
                taskManager.add(index: taskIndex)
            } onDecrement: {
                task.score -= 1
                taskManager.sub(index: taskIndex)
            }
            .padding()
            .frame(alignment: .leading)
        }
    }
}

