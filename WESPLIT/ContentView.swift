//
//  ContentView.swift
//  WESPLIT
//
//  Created by Srinivas Sahu on 08/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let tipPercantages = [10,15,20,25,0]
    
    var totalPerPerson:Double{
        //Calculate will be done here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercantages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Amount",text:$checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people",selection:$numberOfPeople){
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave")){
                    Picker("Tip percentage",selection:$tipPercentage){
                        ForEach(0..<tipPercantages.count){
                            Text("\(self.tipPercantages[$0])$")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    Text("$\(totalPerPerson, specifier:"%.2f")")
                        
                }
            }
            .navigationBarTitle(Text("100 days of Swift UI"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
