//
//  ViewExtensions.swift
//  EmptyState
//
//  Created by yosshi4486 on 2020/04/12
//  
//

import SwiftUI

extension View {
    
    public func emptyStateItems<Items>(@ViewBuilder items: () -> Items) -> some View where Items : View {
        self.preference(key: EmptyStatePreferenceKey.self, value: .init(view: items().eraseToAnyView()))
    }
    
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }

}

