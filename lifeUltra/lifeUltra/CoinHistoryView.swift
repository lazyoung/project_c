//
//  ContentView.swift
//  lifeUltra
//
//  Created by 金刚榕树 on 2023/12/21.
//

import SwiftData
import SwiftUI

struct CoinHistoryView: View {
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        NavigationStack() {
            CoinListView()
                .navigationDestination(for: CoinItem.self) { coinItem in
                    CoinDetailView(coinItem: coinItem)
                }
                .toolbar {
                    Button("Add", systemImage: "plus", action: addCoinItem)
                }
        }
    }
    
    func addCoinItem() {
        let coinItem = CoinItem(task: TaskCoin(), timer: TimerCoin())
        modelContext.insert(coinItem)
    }
}

struct CoinListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \CoinItem.day, order: .reverse) private var coinItems: [CoinItem]
    var body: some View {
        if coinItems.isEmpty {
            ContentUnavailableView.search
        } else {
            List {
                ForEach(coinItems) { coinItem in
                    NavigationLink(value: coinItem) {
                        HStack {
                            if coinItem == coinItems.first {
                                Text("\(coinItem.day) / task / timer as today:")
                                    .fontWeight(.ultraLight)
                            } else {
                                Text("\(coinItem.day) / task / timer:")
                                    .fontWeight(.ultraLight)
                            }
                            Spacer()
                            Text("\(coinItem.sum) / \(coinItem.task.sum) / \(coinItem.timer.sum)")
                        }
                    }
                }
                .onDelete(perform: deletedCoinItem)
            }
        }
    }

    func deletedCoinItem(_ indexSet: IndexSet) {
        indexSet.forEach { index in
            let coinItem = coinItems[index]
            modelContext.delete(coinItem)
        }
    }
    
    
}

struct CoinDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \CoinItem.day, order: .reverse) private var coinItems: [CoinItem]
    @Bindable var coinItem: CoinItem
    var body: some View {
        if coinItem == coinItems.first {
            TabSwitchView(today: coinItem)
        } else {
            VStack(alignment:.leading) {
                Text("Sleep \(coinItem.task.sleep)")
                Text("Diet \(coinItem.task.diet)")
                Text("Work \(coinItem.task.work)")
                Text("Sport \(coinItem.task.sport)")
                Text("Read \(coinItem.task.read)")
                Text("Mood \(coinItem.task.mood)")
                Text("Social \(coinItem.task.social)")
                Text("Finance \(coinItem.task.finace)")
                Text("Interest \(coinItem.task.interest)")
                Text("Sections \(coinItem.timer.sections)")
            }
            .frame(alignment: .leading)
        }
    }
}

#Preview {
    CoinHistoryView()
}
