//
//  Tree.swift
//  NodeTree
//
//  Created by Romain Menke on 12/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation


public class Tree {
    
    public var branches : [Branch] = []
    public var leafs : [Bud] = []
    
    public init(branches branches_I : [Branch]) {
        
        var leafArray : [Bud] = []
        
        // grow branches on tree
        for branch in branches_I {
            
            branches.append(branch)
            
            leafArray += branch.leafs
            
        }
        
        let leafFreq = leafArray.frequencyDict()
        let sortedFreq = splitFreqDict(leafFreq, splitter: branches_I.count, decending: false)
        
        for leaf in sortedFreq {
            
            if !self.leafs.contains(leaf) {
                leaf.tree = self
                self.leafs.append(leaf)
            }
        }
    }
    
    deinit {
        print("deinit")

    }
    
    
    public func bloom() {
        for leaf in leafs {
            leaf.evaluate()
        }
    }
}
