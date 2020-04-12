//
//  EmptyStatePreferenceKey.swift
//  EmptyState
//
//  Created by yosshi4486 on 2020/04/12
//  
//

import SwiftUI

struct EmptyStatePreferenceKey : PreferenceKey {
    static var defaultValue: Value = .init(view: EmptyView().eraseToAnyView())
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
    
    struct Value : Equatable {
        var view: AnyView
        var uuid = UUID()
        
        static func == (lhs: EmptyStatePreferenceKey.Value, rhs: EmptyStatePreferenceKey.Value) -> Bool {
            lhs.uuid == rhs.uuid
        }
    }
    
}
