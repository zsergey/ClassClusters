//
//  AlphabetIterator.swift
//  Class Clusters
//
//  Created by Sergey Zapuhlyak on 9/26/18.
//  Copyright © 2018 zsergey. All rights reserved.
//

import Foundation

public struct AlphabetIterator: IteratorProtocol {
  
  private let alphabet: Alphabet
  private var index = 0
  
  init(alphabet: Alphabet) {
    self.alphabet = alphabet
  }
  
  public mutating func next() -> String? {
    let string = alphabet.string(at: index)
    index += 1
    return string
  }
  
}

