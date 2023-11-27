import SwiftUI

struct TimerMainView: View {
    
    // MARK: - Variable
    @ObservedObject var timerManager:TimerManager
    @AppStorage("work") private var work = 5
    @AppStorage("shortRest") private var shortRest = 2
    @AppStorage("longRest") private var longRest = 3
    @AppStorage("numOfSection") private var numOfSection = 2

    var body: some View {
        
        ScrollView {
            VStack {
                HStack {
                    Text("Section Completed:")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primary)
                        
                    Spacer()
                    
                    Text("\(timerManager.completedSection) / \(timerManager.storage.numOfSections)")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primary)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 25)
                .padding(.bottom, 5)

                TimerView(timerManager: timerManager)
                
                Spacer()
                
                VStack {
                    NavigationLink(
                        destination: TimerPickerView(bindingNum: $work, selectionIndex: (work - 10), lowerBound: 1, upperBound: 60, unit: "Minutes"),
                        label: {
                            TimerSettingsRowView(iconName: "hammer.fill", iconColor: Color.blue, firstText: "Work", secondText: "\(work) Minutes")
                                .padding(.vertical, 3)
                                .buttonStyle(PlainButtonStyle())
                        }).id(UUID())
                    
                    NavigationLink(
                        destination: TimerPickerView(bindingNum: $shortRest, selectionIndex: (shortRest - 5), lowerBound: 1, upperBound: 30, unit: "Minutes"),
                        label: {
                            TimerSettingsRowView(iconName: "die.face.3.fill", iconColor: Color.green, firstText: "Short Break", secondText: "\(shortRest) Minutes")
                                .padding(.vertical, 3)
                                .buttonStyle(PlainButtonStyle())
                        }).id(UUID())
                    
                    NavigationLink(
                        destination: TimerPickerView(bindingNum: $longRest, selectionIndex: (longRest - 15), lowerBound: 1, upperBound: 90, unit: "Minutes"),
                        label: {
                            TimerSettingsRowView(iconName: "bed.double.fill", iconColor: Color.orange, firstText: "Long Break", secondText: "\(longRest) Minutes")
                                .padding(.vertical, 3)
                                .buttonStyle(PlainButtonStyle())
                        }).id(UUID())
                    
                    NavigationLink(
                        destination: TimerPickerView(bindingNum: $numOfSection, selectionIndex: (numOfSection - 2), lowerBound: 1, upperBound: 10, unit: "Sections"),
                        label: {
                            TimerSettingsRowView(iconName: "rectangle.stack", iconColor: Color.red, firstText: "Sections", secondText:"\(numOfSection)")
                                .padding(.vertical, 3)
                                .buttonStyle(PlainButtonStyle())
                        }).id(UUID())
                }
            }
        }
        .onChange(of: work) {
            timerManager.storage = TimerStorage(workSeconds: work, shortRelaxSeconds: shortRest, longRelaxSeconds: longRest, numOfSections: numOfSection)
            timerManager.resetTimer()
        }
        .onChange(of: shortRest) {
            timerManager.storage = TimerStorage(workSeconds: work, shortRelaxSeconds: shortRest, longRelaxSeconds: longRest, numOfSections: numOfSection)
            timerManager.resetTimer()
        }
        
        .onChange(of: longRest) {
            timerManager.storage = TimerStorage(workSeconds: work, shortRelaxSeconds: shortRest, longRelaxSeconds: longRest, numOfSections: numOfSection)
            timerManager.resetTimer()
        }
        .onChange(of: numOfSection) {
            timerManager.storage = TimerStorage(workSeconds: work, shortRelaxSeconds: shortRest, longRelaxSeconds: longRest, numOfSections: numOfSection)
            timerManager.resetTimer()
        }
    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TimerMainView(timerManager: TimerManager())
    }
}
