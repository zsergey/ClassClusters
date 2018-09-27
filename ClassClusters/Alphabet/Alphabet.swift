//
//  Alphabet.swift
//  Class Clusters
//
//  Created by Sergey Zapuhlyak on 26/09/2018.
//  Copyright © 2018 zsergey. All rights reserved.
//

import Foundation

// What is Class Clusters?
// https://developer.apple.com/library/archive/documentation/General/Conceptual/CocoaEncyclopedia/ClassClusters/ClassClusters.html

public class Alphabet: NSObject, Sequence {
  
  // MARK: - Public

  public static func alphabet(with range: Range<Int>) -> Alphabet {
    return RangeAlphabet(with: range)
  }
  
  public static func alphabet(with strings: [String]) -> Alphabet {
    return StringsAlphabet(with: strings)
  }
  
  public static func alphabet(with symbols: String) -> Alphabet {
    return StringsAlphabet(with: symbols.symbols())
  }
  
  public static func alphabet(with alphabets: [Alphabet]) -> Alphabet {
    return ClusterAlphabet(with: alphabets)
  }
  
  public var count: Int {
    doesNotRecognizeSelector(#function)
    return 0
  }
  
  public var string: String {
    return reduce("", +)
  }
  
  public func string(at index: Int) -> String? {
    doesNotRecognizeSelector(#function)
    return nil
  }
  
  public subscript(index: Int) -> String? {
    get {
      return string(at: index)
    }
  }
  
  // MARK: - Sequence
  
  public func makeIterator() -> AlphabetIterator {
    return AlphabetIterator(alphabet: self)
  }
  
}
