//
//  HttpBasicAuthTests.swift
//  HttpBasicAuthTests
//
//  This source file is part of the HttpBasicAuth open source project
//
//  Created by John Becker on 1/13/16.
//  Copyright © 2016 Beckersoft. All rights reserved.
//  Licensed under MIT License
//
//  See LICENSE.txt for license information.
//

import XCTest
@testable import HttpBasicAuth

class HttpBasicAuthTests: XCTestCase {
    
    /// Test Username
    let username = "user"
    
    /// Test Password
    let password = "pass"
    
    /// Test Auth string of the format "username:password"
    var auth:String!
    
    /// Base64 encoded auth string
    var encodedAuth:String!
    
    /// Authorization header dictionary
    var httpHeaders:[String:String]!

    /// Setup
    override func setUp() {
        super.setUp()
        
        self.auth = "\(username):\(password)"
        self.encodedAuth = auth.base64Encode()!
        self.httpHeaders = [
            "Authorization" : "Basic \(self.encodedAuth)"
        ]
    }
    
    /// Tearddown
    override func tearDown() {
        super.tearDown()
    }
    
    /// Linux compatibility
    var allTests : [(String, () -> Void)] {
        return [
            ("test_getCredentials", test_getCredentials),
            ("test_base64EncodingAndDecoding", test_base64EncodingAndDecoding),
            ("test_regularExpressionMatching", test_regularExpressionMatching),
        ]
    }
    
    /// Test getCredentials
    func test_getCredentials() {
        
        // extract credentials
        let credentials = BasicAuth.getCredentials(self.httpHeaders)
        XCTAssertNotNil(credentials)
        XCTAssertEqual(credentials?.username, username)
        XCTAssertEqual(credentials?.password, password)
    }
    
    /// Test base64 endcoding and decoding
    func test_base64EncodingAndDecoding() {
        
        // test string
        let original = "test"
        
        // encode it
        let encoded = original.base64Encode()
        XCTAssertNotNil(encoded)
        
        // decode it
        let decoded = encoded?.base64Decode()
        XCTAssertNotNil(decoded)
        XCTAssertEqual(original, decoded)
    }
    
    /// Test regular expression parsers
    func test_regularExpressionMatching() {
        
        // test credential regex
        let credentials = "Basic \(self.encodedAuth)".regexMatches(
            BasicAuth.credentialsRegEx).last
        XCTAssertNotNil(credentials)
        XCTAssertEqual(self.encodedAuth, credentials)

        // test username password regex
        let userpass = self.auth.regexMatches(BasicAuth.userPassRegEx)
        XCTAssertNotNil(userpass)
        XCTAssertEqual(userpass.count, 3)
        XCTAssertEqual(userpass[0], self.auth)
        XCTAssertEqual(userpass[1], self.username)
        XCTAssertEqual(userpass[2], self.password)
        
    }
    
}
