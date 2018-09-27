//
//  StringsAlphabet.swift
//  Class Clusters
//
//  Created by Sergey Zapuhlyak on 26/09/2018.
//  Copyright © 2018 zsergey. All rights reserved.
//

import Foundation

class StringsAlphabet: Alphabet {
  
  private (set) var strings: [String]
  
  init(with strings: [String]) {
    self.strings = strings
  }
  
  // MARK: - Public
  
  override var count: Int {
    return strings.count
  }
  
  override func string(at index: Int) -> String? {
    guard index >= 0 && index < count else {
      return nil
    }
    return strings[index]
  }
  
}

