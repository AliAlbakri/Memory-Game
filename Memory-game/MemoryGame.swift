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
    
    
    
    init(numberOfPairs:Int,cardContentFactory: (Int)->CardContent) {
        
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, isMatched: false, content: content))
            cards.append(Card(id: pairIndex*2+1, isMatched: false, content: content))
        }
    }
    
    
    func choose(card:Card) {
        print("card choosen: \(card)")
    }
    
    
    struct Card : Identifiable {
        var id: Int
        var isFaceUp:Bool = true
        var isMatched:Bool = false
        var content:CardContent
    }
}
