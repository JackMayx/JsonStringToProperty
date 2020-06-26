//
//  PropertyType.swift
//  SwiftToModelForMac
//
//  Created by godox on 2020/6/26.
//  Copyright © 2020 JackMa. All rights reserved.
//

import Foundation

internal enum PropertyType {
    
    case string
    case int
    case bool
    case double
    case cgFloat
    case unowned
    
    var typeName: String{
        switch self {
        case .string:
            return ": String?"
        case .int:
            return ": Int = 0"
        case .bool:
            return ": Bool = false"
        case .double:
            return ": Double = 0.0"
        case .cgFloat:
            return ": CGFloat = 0.0"
        default:
            return  ": String?"
        }
    }
    
    
}

internal enum ErrorType{
    
    case incorrect
    case noSupport
    case array
    case isEmpty
    
    var errorString: String{
        switch self {
        case .incorrect:
            return "格式不准确"
        case .array:
            return "暂不支持数组类型"
        case .isEmpty:
            return "JSON是空的"
        default:
            return "不支持"
        }
    }
}

internal struct PropertyModel {
    
    var propertyName: String?
    
    var propertyType: String?

}

internal enum ClassAndStruct {
    
    case `class`
    case `struct`
    
    var name: String{
        switch self {
        case .class:
            return "class "
        default:
            return "struct "
        }
    }
    var isRequiredInit: String{
        switch self {
        case .class:
            return "required init() {}"
        default:
            return ""
        }
    }
}

