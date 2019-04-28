//
//  Service.swift
//  Scovil
//
//  Created by Josh Marasigan on 4/27/19.
//  Copyright © 2019 Josh Marasigan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import CoreLocation

// MARK: - Service Error Type
enum ServiceError : Error
{
    case InvalidURL
    case RequestError
    case ParsingError
    case InvalidParameters
}

// MARK: - Service Object
class Service
{
    // MARK: - Properties
    private let rawURL: String
    private var connection: URL? = nil
    
    fileprivate typealias URLResult = (url: URL?, error: ServiceError?)
    
    fileprivate lazy var urlRequest: URLResult = {
        return self.getURL()
    }()
    
    static var headers: HTTPHeaders = [
        "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
        "Accept": "application/json"
    ]
    
    // MARK: - Init
    init(rawURL: String) {
        self.rawURL = rawURL
    }
    
    fileprivate func getURL() -> URLResult
    {
        if let urlConnection = self.connection
        {
            return (urlConnection, nil)
        }
        
        guard let url = URL(string: self.rawURL) else
        {
            return (nil, ServiceError.InvalidURL)
        }
        
        if self.connection == nil
        {
            self.connection = url
        }
        
        return (self.connection, nil)
    }
}
