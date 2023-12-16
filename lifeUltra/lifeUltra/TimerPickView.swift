import SwiftUI

struct TimerPickerView: View {
    
    @Binding var bindingNum: Int
    @State var selectionIndex: Int
    
    let lowerBound: Int
    let upperBound: Int
    let unit: String
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        Picker("Picker", selection: $selectionIndex) {
            ForEach(lowerBound ..< upperBound, id:\.self) {
                Text("\($0) \(unit)")
            }
        }
        .pickerStyle(WheelPickerStyle())
        .onChange(of: selectionIndex) {
            bindingNum =  (selectionIndex + lowerBound)
        }
    }
    
}
