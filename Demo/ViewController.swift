//
//  ViewController.swift
//  Demo
//
//  Created by Sergey Zapuhlyak on 27/09/2018.
//  Copyright © 2018 zsergey. All rights reserved.
//

import UIKit
import ClassClusters

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let rangeAlphabet = Alphabet.alphabet(with: 97..<100)
    printAlphabet(rangeAlphabet, name:"Range Alphabet", lookAt: 1)

    let stringsAlphabet = Alphabet.alphabet(with: ["Sergey", "Max", "Alex"])
    printAlphabet(stringsAlphabet, name:"Strings Alphabet", lookAt: 10)

    let symbolsAlphabet = Alphabet.alphabet(with: "@zsergey")
    printAlphabet(symbolsAlphabet, name: "Symbols Alphabet", lookAt: 0)

    let alphabet = Alphabet.alphabet(with: [rangeAlphabet, stringsAlphabet, symbolsAlphabet])
    printAlphabet(alphabet, name:"Alphabets Alphabet", lookAt: 7)

  }

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
  
}

