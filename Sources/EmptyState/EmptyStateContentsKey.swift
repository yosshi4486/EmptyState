//
//  EmptyStateContentsKey.swift
//  EmptyState
//
//  Created by yosshi4486 on 2020/04/08
//  
//

import SwiftUI

struct EmptyStateContentsKey : PreferenceKey {
    static var defaultValue: AnyView?
    
    static func reduce(value: inout AnyView?, nextValue: () -> AnyView?) {
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
    
    typealias Value = AnyView?
}
