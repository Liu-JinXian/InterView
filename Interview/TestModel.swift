//
//  TestModel.swift
//  Interview
//
//  Created by 劉晉賢 on 2022/8/19.
//
import ObjectMapper

class TestModel: Mappable {
    
    var code: Int?
    var message: String?
    var data: DataModel?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        data <- map["data"]
    }
}

class DataModel: Mappable {
    var totalCount: Int?
    var items: [ItemModel]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        totalCount <- map["totalCount"]
        items <- map["items"]
    }
}

class ItemModel: Mappable {
    var user: UserModel?
    var tags: [String]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        user <- map["user"]
        tags <- map["tags"]
    }
}

class UserModel: Mappable {
    var nickName: String?
    var imageUrl: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        nickName <- map["nickName"]
        imageUrl <- map["imageUrl"]
    }
}
