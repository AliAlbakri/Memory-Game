//
//  MemoryGame.swift
//  Memory-game
//
//  Created by Ali Ahmad on 15/06/2021.
//  Copyright © 2021 Ali Ahmed. All rights reserved.
//

import Foundation


struct MemoryGame<CardContent> where CardContent:Equatable {
    var cards: Array<Card>
    
    var indexOfTheOnlyFaceUpCard:Int? {
        get{
            // filter the indecies such that the index of that card is face up
            return cards.indices.filter { cards[$0].isFaceUp}.only
        }
        
        set{
            for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                }
                else{
                    cards[index].isFaceUp = false
                }
            }
        }
    }
    
    init(numberOfPairs:Int,cardContentFactory: (Int)->CardContent) {
        
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, isMatched: false, content: content))
            cards.append(Card(id: pairIndex*2+1, isMatched: false, content: content))
        }
    }
    
    
   mutating func choose(card:Card) {
    if let choosenIndex = cards.firstIndex(matching: card),!cards[choosenIndex].isFaceUp,!cards[choosenIndex].isMatched{
        
        if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
            if cards[potentialMatchIndex].content == cards[choosenIndex].content{
                cards[potentialMatchIndex].isMatched = true
                cards[choosenIndex].isMatched = true
                
                
            }
            self.cards[choosenIndex].isFaceUp = true

        }
       else{
            indexOfTheOnlyFaceUpCard = choosenIndex
            }
        }
        
    }
   
    
    
    struct Card : Identifiable {
        var id: Int
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content:CardContent
    }
}
