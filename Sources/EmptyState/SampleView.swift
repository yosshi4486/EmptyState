//
//  SampleView.swift
//  EmptyState
//
//  Created by yosshi4486 on 2020/04/08
//  
//

import SwiftUI

struct SampleView : View {
    @State
    var empty: Bool = true
    
    var body: some View {
        EmptyStateView(empty: self.$empty) {
            Text("")
                .emptyStateItems {
                    VStack {
                        Text("Image")
                        Spacer()
                        Text("Title")
                        Spacer()
                        Text("Description")
                    }
            }
        }
    }
    
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
