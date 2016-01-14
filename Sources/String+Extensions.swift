//
//  String+Extensions.swift
//  HttpBasicAuth
//
//  This source file is part of the HttpBasicAuth open source project
//
//  Created by John Becker on 1/13/16.
//  Copyright © 2016 Beckersoft. All rights reserved.
//  Licensed under MIT License
//
//  See LICENSE.txt for license information.
//

import Foundation

/// String extensions
internal extension String {
    
    /**
     Returns strings matching the regular expression pattern.
     
     - Parameter pattern: The regular expression pattern.
     
     - Returns: An array of matching strings.
     */
    func regexMatches(pattern:String) -> [String] {
        
        let regex = try! NSRegularExpression(pattern: pattern,
            options:[.CaseInsensitive])
        
        
        let textCheckingResults = regex.matchesInString(self,
            options: [],
            range: NSMakeRange(0, self.utf16.count))
        
        var matches:[String] = []
        for match in textCheckingResults {
            for index in 0 ..< match.numberOfRanges {
                if let range =
                    self.rangeFromNSRange(match.rangeAtIndex(index)) {
                    matches.append(self.substringWithRange(range))
                }
            }
        }
        return matches
    }
    
    /**
     Converts NSRange to Range<String.Index>.
     
     - Parameter nsRange: The NSRange in need of conversion.
     
     - Returns: A Range<String.Index>? converted based on the string.
     */
    func rangeFromNSRange(nsRange:NSRange) -> Range<String.Index>? {
        let from16 = utf16.startIndex.advancedBy(nsRange.location,
            limit: utf16.endIndex)
        let to16 = from16.advancedBy(nsRange.length, limit: utf16.endIndex)
        if let from = String.Index(from16, within: self),
            to = String.Index(to16, within: self) {
                return from ..< to
        }
        return nil
    }
    
    /**
     Base64 encodes strings using UTF8 string encoding by default.
     
     - Parameter encoding: The encoding to be used. Defaults to UTF8.
     
     - Returns: A base64 encoded string.
     */
    func base64Encode(encoding:NSStringEncoding = NSUTF8StringEncoding)
        -> String? {
        if let encodedData = self.dataUsingEncoding(encoding) {
            return encodedData.base64EncodedStringWithOptions([])
        }
        return nil
    }
    
    /**
     Base64 decodes encoded strings using UTF8 string encoding by default.
     
     - Parameter encoding: The encoding to be used. Defaults to UTF8.
     
     - Returns: A regular string.
     */
    func base64Decode(encoding:NSStringEncoding = NSUTF8StringEncoding)
        -> String? {
        if let data = NSData(base64EncodedString: self, options:[]) {
            return String(data: data, encoding: encoding)
        }
        return nil
    }
}