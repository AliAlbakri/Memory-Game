//
//  Array+Identifiable.swift
//  Memory-game
//
//  Created by Ali Ahmad on 22/06/2021.
//  Copyright © 2021 Ali Ahmed. All rights reserved.
//

import Foundation

extension Array where Element:Identifiable {
    
    func firstIndex(matching:Element) -> Int? {
        for index in 0..<self.count {
                   if self[index].id == matching.id {
                       return index
                   }
               }
               return nil
    }
}
