//
//  ContentView.swift
//  lifeUltra
//
//  Created by 金刚榕树 on 2023/12/16.
//

import SwiftUI
import SwiftData

struct TabSwitchView: View {
    @StateObject var timerManager: TimerManager = TimerManager()
    @StateObject var taskManager: TaskManager = TaskManager()
    @State var timerCoins : Int = 0
    @State var taskCoins : Int = 0
    
    @State private var work: Int = 30
    @State private var shortRest: Int = 5
    @State private var longRest: Int = 20
    @State private var numOfSection: Int = 1
    @State private var itemCoins: Int = 0
    @State private var dailyCoins: Int = 0
    @State private var coinItemName: String = "nil"
    
    var today: CoinItem
    
    var body: some View {
        NavigationView {
            VStack {
                CoinsView(
                    itemCoins: $itemCoins,
                    dailyCoins: $dailyCoins,
                    coinItemName: $coinItemName
                )
                .padding()
                
                TabView() {
                    TaskView(taskManager: taskManager)
                        .onAppear() {
                            coinItemName = "Task"
                            taskCoins = taskManager.sum // update to current View
                            itemCoins = taskCoins // update to CoinsView
                            dailyCoins = timerCoins + taskCoins // update to CoinsView
                            today.task.save(storage: taskManager.storage)
                            today.save()
                        }
                        .onChange(of: taskManager.sum) {
                            taskCoins = taskManager.sum // update to current View
                            itemCoins = taskCoins // update to CoinsView
                            dailyCoins = timerCoins + taskCoins // update to CoinsView
                            today.task.save(storage: taskManager.storage)
                            today.save()
                        }
                    
                    TimerMainView(
                        timerManager: timerManager,
                        work: $work,
                        shortRest: $shortRest,
                        longRest: $longRest,
                        numOfSection: $numOfSection
                    )
                    .onAppear() {
                        coinItemName = "Timer"
                        timerCoins += timerManager.coins // update to current View
                        itemCoins = timerCoins // update to CoinsView
                        dailyCoins = timerCoins + taskCoins // update to CoinsView
                        today.timer.save(sections: timerManager.completedSection)
                        today.save()
                    }
                    .onChange(of: timerManager.coins) {
                        timerCoins += timerManager.coins // update to current View
                        itemCoins = timerCoins // update to CoinsView
                        dailyCoins = timerCoins + taskCoins // update to CoinsView
                        today.timer.save(sections: timerManager.completedSection)
                        today.save()
                    }

                    // TODO: alarm check view
                    // TODO: personal health view
                    // TODO: diary view
                }
                .tabViewStyle(PageTabViewStyle())
                .navigationBarTitle(Text("LifeProc"))
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    ContentView()
}
