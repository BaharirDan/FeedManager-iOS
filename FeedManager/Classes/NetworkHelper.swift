//
//  NetworkHelper.swift
//  FeedManager
//
//  Created by dan baharir on 22/12/2017.
//

import Foundation

protocol NetworkHelper {
    
}



struct Food {
    var type:String?
    var name:String!
    var color:String?
}

enum Result<T> {
    case Success(T)
    case Failure(Error)
    
    func map<P>(f: (T) -> P) -> Result<P> {
        switch self {
        case .Success(let value) :
            return .Success(f(value))
        case .Failure(let error) :
            return .Failure(error)
        }
    }
}

struct FoodService:Gettable {
    func get(completionHandler:(Result<[Food]>) -> Void) {
        
        //do async work here
    }
}

// generic type getter to be used by any service (like FoodService)
protocol Gettable {
    associatedtype T
    func get (completionHandler:(Result<T>) -> Void)
}

protocol Postable {}
