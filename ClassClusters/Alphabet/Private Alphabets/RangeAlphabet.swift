//
//  RangeAlphabet.swift
//  Class Clusters
//
//  Created by Sergey Zapuhlyak on 26/09/2018.
//  Copyright © 2018 zsergey. All rights reserved.
//

import Foundation

class RangeAlphabet: Alphabet {
  
  private (set) var range: Range<Int>
  
  init(with range: Range<Int>) {
    self.range = range
  }
  
  // MARK: - Public
  
  override var count: Int {
    return range.count
  }
  
  override func string(at index: Int) -> String? {
    let charIndex = range.lowerBound + index
    guard index >= 0 && charIndex < range.upperBound else {
      return nil
    }
    return String(Character(UnicodeScalar(UInt8(charIndex))))
  }
}


