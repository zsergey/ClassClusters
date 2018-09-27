Class Clusters
========================================

>Class clusters are a design pattern that the Foundation framework makes extensive use of. Class clusters group a number of private concrete subclasses under a public abstract superclass. The grouping of classes in this way simplifies the publicly visible architecture of an object-oriented framework without reducing its functional richness. Class clusters are based on the Abstract Factory design pattern. 
>
>**Source:** [developer.apple.com](https://developer.apple.com/library/archive/documentation/General/Conceptual/CocoaEncyclopedia/ClassClusters/ClassClusters.html)

### Example:

```swift

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

// MARK: - Private Classes

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

```
### Usage

```swift

import ClassClusters

let rangeAlphabet = Alphabet.alphabet(with: 97..<100)
printAlphabet(rangeAlphabet, name:"Range Alphabet", lookAt: 1)

let stringsAlphabet = Alphabet.alphabet(with: ["Sergey", "Max", "Alex"])
printAlphabet(stringsAlphabet, name:"Strings Alphabet", lookAt: 10)

let symbolsAlphabet = Alphabet.alphabet(with: "@zsergey")
printAlphabet(symbolsAlphabet, name: "Symbols Alphabet", lookAt: 0)

let alphabet = Alphabet.alphabet(with: [rangeAlphabet, stringsAlphabet, symbolsAlphabet])
printAlphabet(alphabet, name:"Alphabets Alphabet", lookAt: 7)

func printAlphabet(_ alphabet: Alphabet, name: String, lookAt index: Int) {
  print(name)
  print("Count elements: \(alphabet.count)")
  print("String: \(alphabet.string)")
  print("String at index \(index): \(alphabet.string(at: index) ?? "none")")
  print("Enumeration:")
  for symbol in alphabet {
    print(symbol)
  }
  print("============================")
}

```

