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
    
    @State private var work: Int = 30
    @State private var shortRest: Int = 5
    @State private var longRest: Int = 20
    @State private var numOfSection: Int = 1
    @State private var itemCoins: Int = 0
    @State private var dailyCoins: Int = 0
    @State private var coinItemName: String = "nil"
    
    var body: some View {
        
        NavigationView {

            TabView() {
                TaskView(taskManager: taskManager)
                .onAppear() {
                    coinItemName = "Task"
                    taskCoins = taskManager.sum // update to current View
                    itemCoins = taskCoins // update to CoinsView
                    dailyCoins = timerCoins + taskCoins // update to CoinsView
                }
                .onChange(of: taskManager.sum) {
                    taskCoins = taskManager.sum // update to current View
                    itemCoins = taskCoins // update to CoinsView
                    dailyCoins = timerCoins + taskCoins // update to CoinsView
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
                }
                .onChange(of: timerManager.coins) {
                    timerCoins += timerManager.coins // update to current View
                    itemCoins = timerCoins // update to CoinsView
                    dailyCoins = timerCoins + taskCoins // update to CoinsView
                }

                // TODO: alarm check view
                // TODO: personal health view
                // TODO: diary view
            }
            .tabViewStyle(PageTabViewStyle())
            .navigationTitle(
                Text(" \(coinItemName) :  \(itemCoins) / \(dailyCoins)")
            )
        }
    }
}

#Preview {
    ContentView()
}
