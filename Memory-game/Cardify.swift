//
//  Cardify.swift
//  Memory-game
//
//  Created by Ali Ahmad on 29/06/2021.
//  Copyright © 2021 Ali Ahmed. All rights reserved.
//

import SwiftUI


struct Cardify:ViewModifier {
    var isFaceUp:Bool
    func body(content: Content) -> some View {
        
        ZStack{
            if isFaceUp {
                RoundedRectangle(cornerRadius: self.cornerRadius)
                          .fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .stroke(lineWidth:self.edgeLineWidth)
                content
                
            }
             else {
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                      .fill()
                
                
              }
        }
    }
    
    private let cornerRadius : CGFloat = 10
    private let edgeLineWidth :CGFloat = 3.5
    
}

extension View {
    func cardify(isFaceUp:Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
        
    }
}
