//
//  ComponentsView2.swift
//  FirstAppSwiftUI
//
//  Created by Carlos Xavier Carvajal Villegas on 24/3/25.
//

import SwiftUI

struct Bulb: Identifiable {
    let id = UUID()
    let name: String
    var isOn: Bool
}

struct ComponentsView2: View {
    @State private var selectedComposer: Composer = composers[0]
    
    @State private var date = Date()
    @State private var dates = Set<DateComponents>()
    
    @State private var color = Color.primary
    @State private var value = 0.0
    
    @State private var lightBulbOn = false
    @State private var bulbs = [
        Bulb(name: "Salon 1", isOn: true),
        Bulb(name: "Cocina", isOn: false),
        Bulb(name: "Hall", isOn: false),
        Bulb(name: "Garage", isOn: true)
    ]

    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle(isOn: $lightBulbOn) {
                        Text("Light Bulb")
                    }
                    .tint(.blue)
                    
                    Toggle(isOn: $lightBulbOn) {
                        Image(systemName: "lightbulb")
                    }
                    .toggleStyle(.button)
                    .font(.largeTitle)
                    .symbolVariant(lightBulbOn ? .fill : .none)
                    .foregroundStyle(lightBulbOn ? .yellow : .primary)
                    .contentTransition(.symbolEffect(.replace))
                    
                    HStack(alignment: .top) {
                        ForEach($bulbs) { $bulb in
                            Toggle(isOn: $bulb.isOn) {
                                VStack {
                                    Image(systemName: "lightbulb")
                                        .symbolVariant(bulb.isOn ? .fill : .none)
                                        .foregroundStyle(bulb.isOn ? .yellow : .primary)
                                        .contentTransition(.symbolEffect(.replace))
                                    
                                    Text(bulb.name)
                                        .font(.caption)
                                }
                            }
                        }
                        Spacer()
                        Toggle(sources: $bulbs, isOn: \.isOn) {
                            VStack {
                                Image(systemName: "lightbulb.2")
                                Text("All")
                                    .font(.caption)
                            }
                        }
                    }
                    .toggleStyle(.button)
                    
                } header: {
                    Text("Selectores")
                }
                
                Section {
                    
                    ColorPicker("Elige Color", selection: $color)
                    
                    Text("Color me, please")
                        .foregroundStyle(color)
                    
                    Slider(value: $value, in: 1...100) {
                        Text("Volume")
                    } minimumValueLabel: {
                        Image(systemName: "speaker")
                    } maximumValueLabel: {
                        Image(systemName: "speaker.fill")
                    }
                    .tint(.orange)
                    Text("\(value.formatted(.number.precision(.fractionLength(0))))")
                    
                    ProgressView("Volume", value: value, total: 100)
                    
                    Stepper("Volume", value: $value, in: 1...100, step: 5)
                    
                    gauge
                    HStack {
                        gauge
                            .gaugeStyle(.accessoryCircular)
                        
                        gauge
                            .gaugeStyle(.accessoryCircularCapacity)
                            .tint(.blue)
                    }
                    
                    HStack {
                        gauge
                            .gaugeStyle(.accessoryLinear)
                        
                        gauge
                            .gaugeStyle(.accessoryLinearCapacity)
                    }
                } header: {
                    Text("Componentes")
                }
                
                Section {
                    DatePicker(selection: $date) {
                        Text("Elija fecha")
                    }
                    
                    DatePicker(selection: $date, displayedComponents: .date) {
                        Text("Elija fecha")
                    }
                    
                    DatePicker(selection: $date,
                               in: Date.now...,
                               displayedComponents: .date) {
                        Text("Elija fecha")
                    }
                    
                    DatePicker(selection: $date,
                               in: Date.now...,
                               displayedComponents: .date) {
                        Text("Elija fecha")
                    }
                               .datePickerStyle(.graphical)
                    
                    MultiDatePicker(selection: $dates) {
                        Text("Seleccione Fecha")
                    }
                    .tint(.orange)
                    .onChange(of: dates) {
                        dates = calcularRangoFechas(from: dates)
                    }
                    
                    Button {
                        dates = []
                    } label: {
                        Text("Reset")
                    }

                } header: {
                    Text("Fechas")
                }
                
                Section {
                    Picker(selection: $selectedComposer) {
                        ForEach(composers) { composer in
                            Text(composer.composer)
                                .tag(composer)
                        }
                    } label: {
                        Text("Select a Composer")
                    }
                    
                    Picker(selection: $selectedComposer) {
                        ForEach(composers) { composer in
                            Text(composer.composer)
                                .tag(composer)
                        }
                    } label: {
                        Text("Select a Composer")
                    }
                    .pickerStyle(.navigationLink)
                    
                    
                    Picker("Composer", systemImage: "music.note", selection: $selectedComposer) {
                        ForEach(composers) { composer in
                            Text(composer.composer)
                                .tag(composer)
                        }
                    }
                    
                    
                } header: {
                    Text("Selectores")
                }
            
            }
        }
    }
    
    var gauge: some View {
        Gauge(value: value, in: 0...100) {
            Text("Volume")
        } currentValueLabel: {
            Text("\(value.formatted(.number.precision(.fractionLength(0))))")
        } minimumValueLabel: {
            Image(systemName: "speaker")
        } maximumValueLabel: {
            Image(systemName: "speaker.fill")
        }
    }
    
    
    func calcularRangoFechas(from selectedDates: Set<DateComponents>) -> Set<DateComponents> {
        let calendar = Calendar.current
        let convertedDates = selectedDates.compactMap { calendar.date(from: $0) }
        
        guard convertedDates.count >= 2,
              let minDate = convertedDates.min(),
              let maxDate = convertedDates.max() else {
            return selectedDates
        }
        
        var rangeDates = Set<DateComponents>()
        var currentDate = minDate
        
        while currentDate <= maxDate {
            let comps = calendar.dateComponents([.year, .month, .day], from: currentDate)
            rangeDates.insert(comps)
            
            guard let nextDate = calendar.date(byAdding: .day, value: 1, to: currentDate) else { break }
            currentDate = nextDate
        }
        
        return rangeDates
    }
}

#Preview {
    ComponentsView2()
}
