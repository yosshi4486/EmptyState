//
//  EnvironmentReaderView.swift
//  EmptyState
//
//  Created by yosshi4486 on 2020/04/08
//  
//

import SwiftUI

struct EnvironmentReaderView<Content, Key> : View where Content : View, Key : PreferenceKey, Key.Value : Equatable {
    
    var content: Content
    
    var modifier: PreferenceWritingModifier<Key>
    
    @State
    var value: Key.Value = Key.defaultValue
    
    init(content: Content, modifier: PreferenceWritingModifier<Key>) {
        self.content = content
        self.modifier = modifier
    }
        
    var body: some View {
        ModifiedContent(
            content: content.onPreferenceChange(Key.self, perform: { (value) in
                DispatchQueue.main.async {
                    self.value = value
                }
            }),
            modifier: modifier
        )
    }
    
}
