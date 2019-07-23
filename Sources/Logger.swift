//
//  Log.swift
//  CustomLog
//
//  Created by Trial on 2019. 07. 18.
//  Copyright © 2019. Trial All rights reserved.
//

import Foundation

private enum Nature: NSString {
    case Info = " Info : "
    case Verbose = " Verbose : "
    case Warning = " Warning : "
    case Error = " Error : "
}

private enum Message: NSString {
    case Start = "------- Log Started -------"
    case End = "---------- Log ended ----------"
}

public class Logger {
    
    fileprivate var currentMessage: NSString
    fileprivate var startTime: Date
    fileprivate var endTime: Date
    fileprivate var nature: Nature
    fileprivate var messages: [NSString]
    
    public init() {
        self.startTime = Date()
        self.endTime = Date()
        self.currentMessage = "\(Message.Start.rawValue) \n \(self.startTime.description)" as NSString
        self.nature = Nature.Info
        self.messages = [currentMessage]
        print("\(Message.Start.rawValue) \n \(self.startTime.description)")
        
    }
    
    fileprivate init(currentMessage: NSString, startTime: Date, endTime: Date, nature: Nature, messages: [NSString]) {
        self.currentMessage = currentMessage
        self.startTime = startTime
        self.endTime = endTime
        self.nature = nature
        self.messages = messages
    }
    
    func getCurrentString() -> NSString {
        return currentMessage
    }
    
    func getLastString() -> NSString {
        return messages.last ?? ""
    }
    
    public func getMessage(_ index: Int) -> NSString {
        return messages[index]
    }
    
    public func info(_ message: NSString) {
        currentMessage = message as NSString
        print("🔣\(Nature.Info.rawValue)\(currentMessage)")
        self.messages.append(currentMessage)
        self.endTime = Date()
    }
    
    public func verbose(_ message: NSString) {
        currentMessage = message as NSString
        print("💬\(Nature.Verbose.rawValue)\(currentMessage)")
        self.messages.append(currentMessage)
        self.endTime = Date()
    }
    
    public func warning(_ message: NSString) {
        currentMessage = message as NSString
        print("⚠️\(Nature.Warning.rawValue)\(currentMessage)")
        self.messages.append(currentMessage)
        self.endTime = Date()
    }
    
    public func error(_ message: NSString) {
        currentMessage = message as NSString
        print("🚩\(Nature.Error.rawValue)\(currentMessage)")
        print(currentMessage)
        self.messages.append(currentMessage)
        self.endTime = Date()
    }
    
    deinit {
        messages.removeAll()
        self.endTime = Date()
        currentMessage = "\(Message.End.rawValue) \n \(self.endTime.description)" as NSString
        self.messages.append(currentMessage)
        print(currentMessage)
    }
}
