//
//  ClusterAlphabet.swift
//  Class Clusters
//
//  Created by Sergey Zapuhlyak on 26/09/2018.
//  Copyright © 2018 zsergey. All rights reserved.
//

import Foundation

class ClusterAlphabet: Alphabet {
  
  private (set) var alphabets: [Alphabet]
  private var countAlphabets: Int!
  
  init(with alphabets: [Alphabet]) {
    self.alphabets = alphabets
    super.init()
    self.countAlphabets = self.count(with: alphabets)
  }
  
  // MARK: - Public
  
  override var count: Int {
    return countAlphabets
  }
  
  override func string(at index: Int) -> String? {
    var currentIndex = 0
    for alphabet in alphabets {
      for i in 0..<alphabet.count {
        if currentIndex == index {
          return alphabet[i]
        }
        currentIndex += 1
      }
    }
    return nil
  }
  
  // MARK: - Private
  
  func count(with alphabets: [Alphabet]) -> Int {
    var result = 0
    for alphabet in alphabets {
      result += alphabet.count
    }
    return result
  }
  
}

