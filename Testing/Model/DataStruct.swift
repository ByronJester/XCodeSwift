//
//  DataStruct.swift
//  Testing
//
//  Created by Byron on 4/5/18.
//  Copyright © 2018 Byron. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RxSwift


import Foundation

//RESPONSE BASIC
struct ResponseBasic {
    var code: String?
    var msg: String?
}

extension ResponseBasic: Mappable{
    init?(map: Map) {}
    mutating func mapping(map: Map){
        code <- map["code"]
        msg  <- map["msg"]
    }
}

//GET NAMES
struct GetNames {
    var name: String?
}

extension GetNames: Mappable{
    init?(map: Map) {}
    mutating func mapping(map: Map){
        name     <- map["name"]
    }
}

//SKILL
struct Skill{
    var ios: String?
    var android: String?
}

extension Skill: Mappable{
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        ios     <- map["ios"]
        android <- map["android"]
    }
}

//USERS
struct NewsfeedData {
    var name : String?
    var postStatus : String?
    var likeCount : String?
    var commentCount : String?
}

extension NewsfeedData: Mappable {
    init?(map: Map) {}

    mutating func mapping(map: Map){
        name                <- map["name"]
        postStatus          <- map["postStatus"]
        likeCount           <- map["likeCount"]
        commentCount        <- map["commentCount"]
    }
}











