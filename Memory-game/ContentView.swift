//
//  ContentView.swift
//  Memory-game
//
//  Created by Ali Ahmad on 14/06/2021.
//  Copyright © 2021 Ali Ahmed. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(content: {
                  
                  RoundedRectangle(cornerRadius: 10).fill(Color.white)
                  RoundedRectangle(cornerRadius: 10)
                      .stroke(lineWidth:4)
                  Text("👻")
              })
              .padding()
              .foregroundColor(Color.orange)
                  .font(Font.largeTitle)
    }
      
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
