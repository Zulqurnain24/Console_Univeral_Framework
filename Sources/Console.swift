//
//  Console.swift
//  Console
//
//  Created by Trial on 2019. 07. 18.
//  Copyright © 2019. Trial All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS) || os(macOS)
    import Foundation

    public class Console {

        #if os(iOS)
        public static let platform = "iOS"
        #endif
        #if os(macOS)
        public static let platform = "macOS"
        #endif
        #if os(tvOS)
        public static let platform = "tvOS"
        #endif
        #if os(watchOS)
        public static let platform = "watchOS"
        #endif

        public static let logger = Logger()
        
    }

#endif
