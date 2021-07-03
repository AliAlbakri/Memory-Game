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
        
        VStack{
            Grid(viewModel.cards){  card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration:1)){
                        self.viewModel.choose(card: card)
                    }
                }
                .padding(4)
            }
            .padding()
            .foregroundColor(Color.orange)
            
            Button(action: {
                withAnimation(.easeInOut(duration:1)){
                    self.viewModel.startNewGame()
                }
            }){ Text("New Game")}
        }
    }
      
}


struct CardView : View{
    
    var card : MemoryGame<String>.Card
    
    @State private var animatedBounsRemaining :Double = 0
    
    private func startBounsTimeAnimation(){
        animatedBounsRemaining = card.bounsRemaining
        withAnimation(.linear(duration:card.bounsTimeRemaining)){
            animatedBounsRemaining = 0
        }
    }
    
    var body: some View{
        GeometryReader{ geometry in
            
            if self.card.isFaceUp || !self.card.isMatched{
                ZStack{
                    Group{
                        if self.card.isConsumingBounsTime {
                            Pie(startAngle:Angle.degrees(0-90), endAngle: Angle.degrees(-self.animatedBounsRemaining*360-90),clockwise: true)
                                .onAppear{
                                    self.startBounsTimeAnimation()
                            }
                            
                        }
                        else{
                            Pie(startAngle:Angle.degrees(0-90), endAngle: Angle.degrees(-self.card.bounsRemaining*360-90),clockwise: true)
                        }
                        
                    }
                    .padding(5).opacity(0.4)
                    Text(self.card.content)
                        .font(Font.system(size: min(geometry.size.width,geometry.size.height)*self.fontScalingFactor))
                        .rotationEffect(Angle.degrees(self.card.isMatched ? 360 : 0))
                        .animation(self.card.isMatched ? Animation.linear(duration: 0.75).repeatForever(autoreverses: false): .default)
                    }
                .cardify(isFaceUp: self.card.isFaceUp)
                .transition(AnyTransition.scale)
            }
            
            
        }
        
    }
    
    
    // MARK: - Drawing Constants
    
    private let fontScalingFactor : CGFloat = 0.60

    
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
       return  ContentView(viewModel:game)
    }
}
