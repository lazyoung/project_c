import SwiftUI

struct TimerPickerView: View {
    
    // MARK: - Variable
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
        // Hide the system back button
        .navigationBarBackButtonHidden(true)
        // Add your custom back button here
        .navigationBarItems(trailing:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }) {
                                    HStack {
                                        Image(systemName: "bookmark.circle.fill")
                                        Text("Save")
                                    }
                                })
        .onChange(of: selectionIndex) {
            bindingNum =  (selectionIndex + lowerBound)
        }
    }
    
}

