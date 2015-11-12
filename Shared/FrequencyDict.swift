//
//  FrequencyDict.swift
//  NodeTree
//
//  Created by Romain Menke on 12/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation


extension SequenceType where Generator.Element : Hashable {
    
    public func frequencyDict() -> Dictionary<Generator.Element,Int> {
        var valueToCount = Dictionary<Generator.Element,Int>()
        for item in self {
            
            if let existingCount = valueToCount[item] {
                valueToCount.updateValue(existingCount + 1, forKey: item)
            } else {
                valueToCount.updateValue(1, forKey: item)
            }
        }
        return valueToCount;
    }
}

public func splitFreqDict<T:Hashable>(dict:[T:Int], splitter:Int, decending:Bool) -> [T] {
    
    var head : [T] = []
    var tail : [T] = []
    
    let sortedDict : [(T, Int)]
    
    if decending {
        sortedDict = dict.sort { $0.1 > $1.1 }
    } else {
        sortedDict = dict.sort { $0.1 > $1.1 }
    }
    
    for item in sortedDict {
        if item.1 >= splitter {
            tail.append(item.0)
        } else {
            head.append(item.0)
        }
    }
    
    return head + tail
}