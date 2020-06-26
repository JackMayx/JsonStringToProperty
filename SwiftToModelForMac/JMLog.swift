//
//  JMLog.swift
//  SwiftToModelForMac
//
//  Created by godox on 2020/6/26.
//  Copyright © 2020 JackMa. All rights reserved.
//

import Foundation



public func JMLog<T>(_ message: T, file:String = #file, line:Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("🏀🏀~~~~~~~~~~~~🏀🏀\n文件名称:\(fileName)\n所在行数:\(line)\n数据打印:\(message)\n🏀🏀~~~~~~~~~~~~🏀🏀\n")
    #endif
}
