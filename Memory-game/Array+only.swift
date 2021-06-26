//
//  Array+only.swift
//  Memory-game
//
//  Created by Ali Ahmad on 26/06/2021.
//  Copyright © 2021 Ali Ahmed. All rights reserved.
//

import Foundation

extension Array{
    
    var only:Element? {
      return  self.count == 1 ? first : nil
    }
}
