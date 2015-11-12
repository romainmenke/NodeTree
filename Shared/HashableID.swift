//
//  File.swift
//  NodeTree
//
//  Created by Romain Menke on 12/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation

public class AutoHashID {
    // shared instance
    public static let global = AutoHashID()
    
    // dict for each type
    private var storedGlobalIDForType : [String:Int] = [String:Int]()
    
    // serial queue
    private let _serialQueue = dispatch_queue_create("HashQueue", DISPATCH_QUEUE_SERIAL)
    
    
    public func idForType(type: Any) -> Int {
        
        var id : Int = 0
        
        // make it thread safe
        dispatch_sync(_serialQueue) {
            
            let typeName = String(reflecting: type)
            
            // check if there is already an ID
            guard let currentID = self.storedGlobalIDForType[typeName] else {
                
                // if there isn't an ID, store one
                let currentID : Int = 0
                self.storedGlobalIDForType[typeName] = currentID
                id = Int(currentID)
                
                return
            }
            
            // if there is an ID, increment
            id = currentID
            id++
            
            // store the incremented ID
            self.storedGlobalIDForType[typeName] = id
        }
        
        return id
    }
    
    private init() {}
    
}