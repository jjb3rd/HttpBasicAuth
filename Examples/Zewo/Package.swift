//
//  Package.swift
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

import PackageDescription

let package = Package(
    name: "ExampleAPI",
    dependencies: [
        .Package(url:"https://github.com/Zewo/Epoch", versions: Version(0,0,1)..<Version(1,0,0)),
        .Package(url:"https://github.com/Zewo/Router", versions: Version(0,0,1)..<Version(1,0,0)),
        .Package(url: "https://github.com/jjb3rd/HttpBasicAuth", versions: Version(0,1,1)..<Version(0,2,0))
    ]
)
