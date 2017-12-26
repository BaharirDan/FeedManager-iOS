//
//  NetworkHelper.swift
//  FeedManager
//
//  Created by dan baharir on 22/12/2017.
//

import Foundation

protocol NetworkHelper {
    
}



public struct Food {
    public var type:String?
    public var name:String!
    public var color:String?
    
    init(type:String?,name:String!,color:String?){
        self.name = name
        self.type = type
        self.color = color
    }
}

public enum Result<T> {
    case Success(T)
    case Failure(Error)
    
    public func map<P>(f: (T) -> P) -> Result<P> {
        switch self {
        case .Success(let value) :
            return .Success(f(value))
        case .Failure(let error) :
            return .Failure(error)
        }
    }
}

public struct FoodService:Gettable {
    public func get(completionHandler:(Result<[Food]>) -> Void) {
        completionHandler(.Success([Food(type:"s",name:"s",color:"s")]) )
    }
}

// generic type getter to be used by any service (like FoodService)
public protocol Gettable {
    associatedtype T
    func get (completionHandler:(Result<T>) -> Void)
}

protocol Postable {}
