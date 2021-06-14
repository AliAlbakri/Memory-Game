//
//  MemoryGame.swift
//  Memory-game
//
//  Created by Ali Ahmad on 15/06/2021.
//  Copyright © 2021 Ali Ahmed. All rights reserved.
//

import Foundation


struct MemoryGame<CardContent>{
    var cards: Array<Card>
    
    func choose(card:Card) {
        print("card choosen: \(card)")
    }
    
    
    struct Card {
        var isFaceUp:Bool
        var isMatched:Bool
        var content:CardContent
    }
}
