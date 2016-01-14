# HttpBasicAuth

[![Swift 2.2](https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat)](https://swift.org)
[![Build Status](https://travis-ci.org/jjb3rd/HttpBasicAuth.svg)](https://travis-ci.org/jjb3rd/HttpBasicAuth)
[![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://opensource.org/licenses/MIT)

Generic basic auth Authorization header field parser for swift.  

## Installation

```swift
import PackageDescription

let package = Package(
  name: "AwesomeProject",
  dependencies: [
    .Package(url: "https://github.com/jjb3rd/HttpBasicAuth", majorVersion: 0, minor: 1)
  ]
)
```

## API

```swift
import HttpBasicAuth
```

### getCredentials

Get the basic auth credentials from the given http header dictionary. The 
`Authorization` header is parsed and if the header is invalid, `nil` is returned,
otherwise a `Credentials` object with `username` and `password` properties is 
returned.

## Example

Pass a `[String:String]` dictionary of HTTP headers to `BasicAuth.getCredentials`. 
If parsing fails `nil` is returned, otherwise a Credentials object with
`username` and `password` properties is returned.

```swift
let headers = ["Authorization" : "Basic dXNlcjpwYXNzd2Q="]
let credentials = BasicAuth.getCredentials(headers)
print("username: \(credentials.username) and password: \(credentials.password)")
```

# Thanks

Thanks to the [basic-auth](https://github.com/jshttp/basic-auth) guys.  This is a swift port of the node.js project.

# License

[The MIT License (MIT)](LICENSE.txt)

```
The MIT License (MIT)

Copyright (c) 2016 Beckersoft, Inc. <john@beckersoft.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
