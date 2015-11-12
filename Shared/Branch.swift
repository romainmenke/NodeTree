//
//  Branch.swift
//  NodeTree
//
//  Created by Romain Menke on 12/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation


public class Branch: Hashable {
    
    var leafs : [Bud]
    
    public var broken : Bool = false
    
    public var id: Int
    public var hashValue: Int {
        return self.id
    }
    
    public init(id id_I:Int, leafs leafs_I : [Bud]) {
        
        id = AutoHashID.global.idForType(Branch)
        
        leafs = leafs_I
    }
    
    deinit {
        print("deinit",id)
    }
    
}

public func ==(lhs: Branch, rhs: Branch) -> Bool {
    return lhs.id == rhs.id
}