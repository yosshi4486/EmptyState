//
//  PreferenceWritingModifier.swift
//  EmptyState
//
//  Created by yosshi4486 on 2020/04/08
//  
//

import SwiftUI

struct PreferenceWritingModifier<Key> : ViewModifier where Key : PreferenceKey {
    
    var value: Key.Value
    
    func body(content: Content) -> some View {
        content.preference(key: Key.self, value: value)
    }
        
}

extension PreferenceWritingModifier : Equatable where Key.Value : Equatable { }
