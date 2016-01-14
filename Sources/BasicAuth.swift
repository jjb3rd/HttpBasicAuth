//
//  BasicAuth.swift
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

/**
A library for parsing Basic HTTP Authentication credentials from a header
dictionary.
*/
public class BasicAuth {
    
    /**
     Regular Expression for basic auth credentials
     
     credentials = auth-scheme 1*SP token68
     auth-scheme = "Basic" ; case insensitive
     token68     = 1*( ALPHA / DIGIT / "-" / "." / "_" / "~" / "+" / "/" ) *"="
     */
    internal static let credentialsRegEx =
        "^ *(?:[Bb][Aa][Ss][Ii][Cc]) +([A-Za-z0-9\\-\\._~\\+\\/]+=*) *$"
    
    /**
     Regular Expression for basic auth user/pass
     
     user-pass   = userid ":" password
     userid      = *<TEXT excluding ":">
     password    = *TEXT
     */
    internal static let userPassRegEx = "^([^:]*):(.*)$"
    
    /**
     Parse the Authorization header field of a request.
     
     - Parameter headers:   A dictionary of HTTP headers.

     - Returns: Credentials with the username and password or nil if none exist.
     */
    public class func getCredentials(headers:[String:String]) -> Credentials? {
        
        // get header
        if let header = headers["Authorization"],
            // regex match the base64 encoded basic authorization
            encodedAuth = header.regexMatches(credentialsRegEx).last,
            // base64 decode the auth string
            decodedAuth = encodedAuth.base64Decode() {
            // regex match the username and password
            let userPass = decodedAuth.regexMatches(userPassRegEx)
            // ensure we have enough matches
            if userPass.count == 3 {
                // return the Credentials with the username and password
                return Credentials(username:userPass[1], password:userPass[2])
            }
        }
        
        // no credentials were found
        return nil
    }
    
}

