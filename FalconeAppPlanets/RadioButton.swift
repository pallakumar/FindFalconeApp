//
//  RadioButton.swift
//  FalconeAppPlanets
//
//  Created by apple on 05/07/25.
//

import SwiftUI
 

struct RadioButton: View {
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Circle()
                .strokeBorder(Color.primary, lineWidth: 2)
                .background(Circle().fill(isSelected ? Color.blue : Color.clear))
                .frame(width: 20, height: 20)
        }
    }
}
