//
//  ContentView.swift
//  Memory-game
//
//  Created by Ali Ahmad on 14/06/2021.
//  Copyright © 2021 Ali Ahmed. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var body: some View {
        
       
            Grid(viewModel.cards){  card in
                CardView(card: card).onTapGesture {
                    print(self.viewModel.choose(card: card))
                    
                }
                .padding(4)
            }
            
        
        
              .padding()
              .foregroundColor(Color.orange)
    }
      
}


struct CardView : View{
    
    var card : MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader{ geometry in
            ZStack{
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                              .fill(Color.white)
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .stroke(lineWidth:self.edgeLineWidth)
                    Text(self.card.content)
                      }
                      else {
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                          .fill()
                      }
                      
            
                  }
            .font(Font.system(size: min(geometry.size.width,geometry.size.height)*self.fontScalingFactor))
        
            
        }
        
    }
    
    
    // MARK: - Drawing Constants
    
    let fontScalingFactor : CGFloat = 0.70
    let cornerRadius : CGFloat = 10
    let edgeLineWidth :CGFloat = 3.5
    
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
