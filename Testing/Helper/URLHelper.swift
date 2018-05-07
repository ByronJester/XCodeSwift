//
//  URLHelper.swift
//  Testing
//
//  Created by Byron on 4/5/18.
//  Copyright © 2018 Byron. All rights reserved.
//

import Foundation
class URLHelper : NSObject{
    var baseURL = Config.baseURL
    
    func register()->String{
       return baseURL + "AccountSetupMobile/register"
    }
    func login()->String{
        return baseURL + "AccountSetupMobile/login"
    }
    
    func getNames()->String{
        return baseURL + "AccountSetupMobile/getNames"
    }
    
    func postStatus()->String{
        return baseURL + "UserStatusMobile/postStatus"
    }

    func newsfeedData()->String{
        return baseURL + "UserStatusMobile/newsfeedData"
    }
    
    func lcCount()->String{
        return baseURL + "AccountSetupMobile/lcCount"
    }
    
    func deletePost()->String{
        return baseURL + "UserSetupMobile/deletePost"
    }
}
