//
//  Leaf.swift
//  NodeTree
//
//  Created by Romain Menke on 12/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation

public class Leaf<T>: Bud {
    
    var premise : (T) -> Bool
    var captureValue : T
    
    public init(id id_I: Int, premise premise_I: (T) -> Bool, value:T) {
        
        premise = premise_I
        captureValue = value
        
        super.init(id: id_I)
        
    }
    
    deinit {
        print("deinit",id)
    }
    
    
    override func evaluate() {
        
        guard let uwTree = tree else {
            return
        }
        
        var branches : [Branch] = []
        
        for branch in uwTree.branches {
            if branch.leafs.contains(self) {
                branches.append(branch)
            }
        }
        
        var goodBranch : Bool = true
        print("evaluate")
        for branch in branches {
            print("evaluate branch")
            guard branch.broken else {
                continue
            }
            goodBranch = false
            break
        }
        
        if goodBranch {
            self.answer = self.premise(self.captureValue)
        }
        
    }
    
}

public class Bud: Hashable {
    
    var answer : Bool? {
        didSet {
            guard let uwAnswer = answer else {
                return
            }
            rustle(uwAnswer)
        }
    }
    
    weak var tree : Tree?
    
    var id : Int
    public var hashValue: Int {
        return self.id
    }
    
    init(id id_I:Int) {
        id = AutoHashID.global.idForType(Bud)
        
    }
    
    deinit {
        print("deinit",id)
    }
    
    func rustle(foundAnswer : Bool) {
        
        guard !foundAnswer else {
            return
        }
        
        guard let uwTree = tree else {
            return
        }
        
        var branches : [Branch] = []
        
        for branch in uwTree.branches {
            if branch.leafs.contains(self) {
                branches.append(branch)
            }
        }
        
        for branch in branches {
            
            //dispatch_async(dispatch_get_main_queue()) {
            branch.broken = true
            //}
        }
    }
    
    func evaluate() {
    }
    
}

public func ==(lhs: Bud, rhs: Bud) -> Bool {
    return lhs.id == rhs.id
}