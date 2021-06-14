//
//  EmojiMemoryGame.swift
//  Memory-game
//
//  Created by Ali Ahmad on 15/06/2021.
//  Copyright © 2021 Ali Ahmed. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    
    // model pointer
    
    var model : MemoryGame<String> = MemoryGame<String>(cards: Array<MemoryGame.Card>())
    
    
    // MARK: - Access to the model
    
    var cards : Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - User Intents
    
    func choose(card:MemoryGame<String>.Card){
        
        model.choose(card: card)
    }
    
    
}
