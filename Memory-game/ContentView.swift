//
//  ContentView.swift
//  Memory-game
//
//  Created by Ali Ahmad on 14/06/2021.
//  Copyright © 2021 Ali Ahmed. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel : EmojiMemoryGame
    
    var body: some View {
        
        HStack{
            ForEach(viewModel.cards){  card in
                CardView(card: card).onTapGesture {
                    print(self.viewModel.choose(card: card))
                    
                }
            }
            
        }
        
              .padding()
              .foregroundColor(Color.orange)
                  .font(Font.largeTitle)
    }
      
}


struct CardView : View{
    
    var card : MemoryGame<String>.Card
    
    var body: some View{
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth:5)
                Text(card.content)
            }
            else {
                RoundedRectangle(cornerRadius: 10)
                .fill()
            }
            
            

             
            
        }
        
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
