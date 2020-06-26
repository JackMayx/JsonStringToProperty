//
//  ViewController.swift
//  SwiftToModelForMac
//
//  Created by godox on 2020/6/26.
//  Copyright © 2020 JackMa. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet weak var inputJsonString: NSTextView!
    @IBOutlet var outputJsonString: NSTextView!
    
    
    @IBOutlet weak var chooseType: NSSegmentedControl!
    @IBOutlet weak var name: NSTextField!
    @IBOutlet weak var otherName: NSTextField!
    
    var jsonToModel = JsonStringToModelProperty()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputJsonString.isEditable = false
        
    }

    @IBAction func buttonMethods(_ sender: NSButton) {

        if name.stringValue.count != 0 {
            jsonToModel.className = name.stringValue
            jsonToModel.superName = otherName.stringValue
            jsonToModel.toModelProperty(with: inputJsonString.string)
            outputJsonString.string = jsonToModel.propertyListString
        }else{
            JMLog("错误信息: 类名不能为空")
        }
        
    }
    
    @IBAction func chooseTypeState(_ sender: NSSegmentedControl) {
        if sender.selectedSegment == 0 {
            jsonToModel.classType = .class
        }else{
            jsonToModel.classType = .struct
        }
    }
    
    @IBAction func saveFile(_ sender: NSButton) {
        JMLog("以后再看，先用着")
    }
    override var representedObject: Any? {
        didSet {
            
        }
    }

}

