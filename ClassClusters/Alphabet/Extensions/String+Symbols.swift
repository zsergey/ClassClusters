//
//  String+Symbols.swift
//  ClusterFramework
//
//  Created by Sergey Zapuhlyak on 27/09/2018.
//  Copyright © 2018 zsergey. All rights reserved.
//

import Foundation

extension String {
  
  func symbols() -> [String] {
    var result = [String]()
    for offset in 0..<count {
      let string = String(self[index(startIndex, offsetBy: offset)])
      result.append(string)
    }
    return result
  }
  
}

