//
//  JsonStringToModelProperty.swift
//  SwiftToModelForMac
//
//  Created by godox on 2020/6/26.
//  Copyright © 2020 JackMa. All rights reserved.
//

import Cocoa


internal class JsonStringToModelProperty{
    
    internal var className: String?
    
    internal var superName: String?
    
    internal var classType: ClassAndStruct = .class
    
    internal private(set) var propertyListString: String!
    
    private var isRequiredInit: String{
        return classType.isRequiredInit
    }
    private var endTip: String{
        return "}\n\n"
    }
    private var errorType: ErrorType = .isEmpty

    internal func toModelProperty(with JsonString : String){
        propertyListString = ""
        var value : Any?
        do {
            value = try JSONSerialization.jsonObject(with: JsonString.data(using: String.Encoding.utf8)!, options: JSONSerialization.ReadingOptions.mutableContainers)
        } catch {
            errorType = .incorrect
        }
        
        if value is Dictionary<String, Any>{
            logicalProcesse(value as! Dictionary<String, Any>, className!)
            
        }else if value is Array<Any>{
            errorType = .array
        }else{
            errorType = .noSupport
        }
        JMLog("错误信息：\(errorType.errorString) or JSON格式错误")
        
    }
    private func logicalProcesse(_ dict: Dictionary<String, Any>, _ _className: String){
     var property: PropertyModel?
     var propertyArray: Array<PropertyModel> = [PropertyModel]()
     var type: PropertyType = .string
        
        for (key , value) in dict{
            
            switch value {
            case is String:
                type = .string
                property = PropertyModel(propertyName: key, propertyType: type.typeName)
                propertyArray.append(property!)
            case is Int:
                type = .int
                property = PropertyModel(propertyName: key, propertyType: type.typeName)
                propertyArray.append(property!)
            case is Double:
                type = .double
                property = PropertyModel(propertyName: key, propertyType: type.typeName)
                propertyArray.append(property!)
            case is CGFloat:
                type = .cgFloat
                property = PropertyModel(propertyName: key, propertyType: type.typeName)
                propertyArray.append(property!)
            case is Bool:
                type = .bool
                property = PropertyModel(propertyName: key, propertyType: type.typeName)
                propertyArray.append(property!)
            case is Array<Any>:
                property = PropertyModel(propertyName: key, propertyType: ": \(key.capitalized)List?")
                propertyArray.append(property!)
                logicalProcesse(((value as! Array<Any>).first as! Dictionary<String, Any>), "\(key.capitalized)List")
            case is Dictionary<String, Any>:
                property = PropertyModel(propertyName: key, propertyType: ": \(key.capitalized)Map?")
                propertyArray.append(property!)
                logicalProcesse(value as! Dictionary<String, Any>, "\(key.capitalized)Map")
            default:
                break
            }
        }
        mergeModelProperty(_className, propertyArray)
    }

    
    
    func mergeModelProperty(_ className: String, _ propertys: [PropertyModel]){
        var properTyPrefix = ""
        if classType == .class {
            if superName != "" {
                properTyPrefix = "class \(className): \(superName!) {"
            }else{
                properTyPrefix = "class \(className) {"
            }
        }else{
            if superName != "" {
                properTyPrefix = "struct \(className): \(superName!) {"
            }else{
                properTyPrefix = "struct \(className) {"
            }
        }
        var propertyItems = ""
        for item in propertys {
            propertyItems.append("\tvar \(item.propertyName!)\(item.propertyType!)\n\n")
        }
        let propertyModel = "\(properTyPrefix)\n\n\(propertyItems)\t\(isRequiredInit)\n\n\(endTip)"
        
        propertyListString.append(propertyModel)
    }
}
