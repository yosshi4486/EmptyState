//
//  EmptyStateContentsKey.swift
//  EmptyState
//
//  Created by yosshi4486 on 2020/04/08
//  
//

import SwiftUI

struct EmptyStatePreference : Equatable {
    
    var view: AnyView
    var identifier = UUID() // I don't catch a good way to check equatability. (Reflection?)
    
    init(view: AnyView) {
        self.view = view
    }
    
    init() {
        self.init(view: AnyView(EmptyView()))
    }
    
    static func == (lhs: EmptyStatePreference, rhs: EmptyStatePreference) -> Bool {
        lhs.identifier == rhs.identifier
    }

}

struct EmptyStateContentsKey : PreferenceKey {
    
    static var defaultValue: EmptyStatePreference = .init()
    
    static func reduce(value: inout EmptyStatePreference, nextValue: () -> EmptyStatePreference) {
        // If multiple keys are set, latest key is used from parent.
        
        /* Possible case example:
         NavigationView {
             Text("Hello World")
                 .navigationBarTitle(Text("TitleA"))
                 .navigationBarTitle(Text("TitleB"))
                 .navigationBarTitle(Text("TitleC"))
         }
         */
        value = nextValue()
    }
    
    typealias Value = EmptyStatePreference
}
