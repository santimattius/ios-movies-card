//
//  Extensions.swift
//  ios-movies-card
//
//  Created by Santiago Mattiauda on 16/12/21.
//

import Foundation
import SwiftUI

extension AnyTransition {
    
    static var trailingBottomAtRemoval: AnyTransition{
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: AnyTransition
                                    .move(edge: .trailing)
                                    .combined(with: .move(edge: .bottom)))
    }
    
    
    static var leadingBottomAtRemoval: AnyTransition{
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: AnyTransition
                                    .move(edge: .leading)
                                    .combined(with: .move(edge: .bottom)))
    }
}
