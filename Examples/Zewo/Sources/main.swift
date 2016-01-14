//
//  main.swift
//  HttpBasicAuth Example with Zewo
//
//  This source file is part of the HttpBasicAuth open source project
//
//  Created by John Becker on 1/14/16.
//  Copyright © 2016 Beckersoft. All rights reserved.
//  Licensed under MIT License
//
//  See LICENSE.txt for license information.
//

#if os(Linux)
    import Glibc
#else
    import Darwin.C
#endif

import HTTP
import Router
import Epoch
import HttpBasicAuth

let router = Router { routerBuilder in
    
    routerBuilder.get("/auth") { request in
        
        // Get the basic authentication credentials
        if let credentials = BasicAuth.getCredentials(request.headers) {
            
            // we successfully retrieved the credentials.
            // normally you'd want to validate those credentials, but we'll just
            // return the username
            return Response(
                status: .OK,
                json: [
                    "username" : .StringValue(credentials.username)
                ]
            )
        } else {
            
            // we could not extract the basic authentication credentials
            return Response(status: .Unauthorized)
        }
    }
}

Server(port: 8080, responder:router).start()
