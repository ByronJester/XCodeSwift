//
//  APIService.swift
//  Testing
//
//  Created by Byron on 4/5/18.
//  Copyright © 2018 Byron. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RxSwift

class APIService{
    let urlhelper = URLHelper()
    
//    var hasInternet: Bool
//    init() {
//
//    }
    
    //Register Account
    func register(_ data : Dictionary<String, Any>?) -> Observable<ResponseBasic>? {
        let url   = urlhelper.register()
        return Observable<ResponseBasic>.create({ observer in
            let request = Alamofire.request(url, method: .post, parameters: data)
                .validate()
                .responseObject(completionHandler: { (response: DataResponse<ResponseBasic>) in
                    switch response.result {
                    case .success(let reponse):
                        observer.onNext(reponse)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                })
            return Disposables.create(with: { request.cancel() })
        })
    }
   
    
    //Login Account
    func login(_ data : Dictionary<String, Any>?) -> Observable<ResponseBasic>? {
        let url   = urlhelper.login()
        return Observable<ResponseBasic>.create({ observer in
            let request = Alamofire.request(url, method: .post, parameters: data)
                .validate()
                .responseObject(completionHandler: { (response: DataResponse<ResponseBasic>) in
                    switch response.result {
                    case .success(let reponse):
                        observer.onNext(reponse)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                })
            return Disposables.create(with: { request.cancel() })
        })
    }
    
    //Get Names
    func getNames(_ data : Dictionary<String, Any>?) -> Observable<[GetNames]>? {
        let url   = urlhelper.getNames()
        return Observable<[GetNames]>.create({ observer in
            let request = Alamofire.request(url, method: .post, parameters: data)
                .validate()
                .responseArray(completionHandler: { (response: DataResponse<[GetNames]>) in
                    switch response.result {
                    case .success(let reponse):
                        observer.onNext(reponse)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                })
            return Disposables.create(with: { request.cancel() })
        })
    }
    
    
    //Post Status
    func postStatus(_ data : Dictionary<String, Any>?) -> Observable<ResponseBasic>? {
        let url   = urlhelper.postStatus()
        return Observable<ResponseBasic>.create({ observer in
            let request = Alamofire.request(url, method: .post, parameters: data)
                .validate()
                .responseObject(completionHandler: { (response: DataResponse<ResponseBasic>) in
                    switch response.result {
                    case .success(let reponse):
                        observer.onNext(reponse)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                })
            return Disposables.create(with: { request.cancel() })
        })
    }
    
    //Newsfeed Data
    func newsfeedData(_ data : Dictionary<String, Any>?) -> Observable<[NewsfeedData]>? {
        let url   = urlhelper.newsfeedData()
        return Observable<[NewsfeedData]>.create({ observer in
            let request = Alamofire.request(url, method: .post, parameters: data)
                .validate()
                .responseArray(completionHandler: { (response: DataResponse<[NewsfeedData]>) in
                    switch response.result {
                    case .success(let reponse):
                        observer.onNext(reponse)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                })
            return Disposables.create(with: { request.cancel() })
        })
    }
    
    // Delete Post
    func deletePost(_ data : Dictionary<String, Any>?) -> Observable<[NewsfeedData]>? {
        let url   = urlhelper.deletePost()
        return Observable<[NewsfeedData]>.create({ observer in
            let request = Alamofire.request(url, method: .post, parameters: data)
                .validate()
                .responseArray(completionHandler: { (response: DataResponse<[NewsfeedData]>) in
                    switch response.result {
                    case .success(let reponse):
                        observer.onNext(reponse)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                })
            return Disposables.create(with: { request.cancel() })
        })
    }

}
