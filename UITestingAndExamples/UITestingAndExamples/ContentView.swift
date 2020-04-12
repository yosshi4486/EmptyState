//
//  ContentView.swift
//  UITestingAndExamples
//
//  Created by yosshi4486 on 2020/04/12
//  Copyright © 2020 RAISO. All rights reserved.
//

import SwiftUI
import EmptyState

struct ContentView: View {
      
    @State
    var isEmpty: Bool = false
        
    var body: some View {
        EmptyStateView(empty: self.$isEmpty, content: {
            
            Button(action: {
                self.isEmpty.toggle()
            }) {
                Text("Toggle empty state.")
            }
            .accessibility(identifier: "ToggleButton")
                .emptyStateItems {
                    VStack(spacing: 30) {
                        Image(systemName: "person.3")
                            .scaleEffect(4)
                            .padding()
                            .accessibility(identifier: "EmptyImage")
                        
                        Text("No mutual friends to show")
                            .accessibility(identifier: "EmptyText")
                        
                        Button(action: {
                            self.isEmpty.toggle()
                        }) {
                            Text("FIND FRIENDS")
                        }
                        .padding(10)
                        .border(Color.blue, width: 1)
                        .accessibility(identifier: "EmptyButton")
                    }
            }
        })
    }

}
