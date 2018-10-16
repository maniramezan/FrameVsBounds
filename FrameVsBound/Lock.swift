//
//  UnFairLock.swift
//  FrameVsBound
//
//  Created by Mani Ramezan on 10/15/18.
//  Copyright © 2018 Manman. All rights reserved.
//

import Foundation
import Darwin

protocol Lock {
    func lock()
    func unlock()
    
    func sync(action: () -> Void)
}

class UnFairLockWrapper: Lock {
    lazy var unfairLock = os_unfair_lock_s()
    
    func lock() {
        os_unfair_lock_lock(&unfairLock)
    }
    
    func unlock() {
        os_unfair_lock_unlock(&unfairLock)
    }
    
    func sync(action: () -> Void) {
        lock()
        
        action()
        
        unlock()
    }
    
    
}
