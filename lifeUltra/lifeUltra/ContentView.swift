//
//  ContentView.swift
//  lifeUltra
//
//  Created by 金刚榕树 on 2023/12/16.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var timerManager: TimerManager = TimerManager()
    @StateObject var taskManager: TaskManager = TaskManager()
    @State var timerCoins : Int = 0
    @State var taskCoins : Int = 0
    
    @State private var work: Int = 5
    @State private var shortRest: Int = 2
    @State private var longRest: Int = 3
    @State private var numOfSection: Int = 2
    @State private var itemCoins: Int = 0
    @State private var dailyCoins: Int = 0
    @State private var coinItemName: String = "nil"
    
    var body: some View {
        
        NavigationView {

            VStack {
                CoinsView(
                    itemCoins: $itemCoins,
                    dailyCoins: $dailyCoins,
                    coinItemName: $coinItemName
                )
                .padding(.horizontal, 20)
                .padding(.top, 10)

                TabView() {
                    TaskView(taskManager: taskManager)
                    .onAppear() {
                        coinItemName = "Task"
                        taskCoins = taskManager.sum // update to current View
                        itemCoins = taskCoins // update to CoinsView
                        dailyCoins = timerCoins + taskCoins // update to CoinsView
                        print("Task View appear")
                    }
                    .onChange(of: taskManager.sum) {
                        taskCoins = taskManager.sum // update to current View
                        itemCoins = taskCoins // update to CoinsView
                        dailyCoins = timerCoins + taskCoins // update to CoinsView
                        print("Task View change")
                    }
                    
                    TimerMainView(
                        timerManager: timerManager,
                        work: $work,
                        shortRest: $shortRest,
                        longRest: $longRest,
                        numOfSection: $numOfSection
                    )
                    .padding(.top, 5)
                    .tag(0)
                    .onAppear() {
                        coinItemName = "Timer"
                        timerCoins += timerManager.coins // update to current View
                        itemCoins = timerCoins // update to CoinsView
                        dailyCoins = timerCoins + taskCoins // update to CoinsView
                        print("Timer View appear")
                    }
                    .onChange(of: timerManager.coins) {
                        timerCoins += timerManager.coins // update to current View
                        itemCoins = timerCoins // update to CoinsView
                        dailyCoins = timerCoins + taskCoins // update to CoinsView
                        print("Timer View change")
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
