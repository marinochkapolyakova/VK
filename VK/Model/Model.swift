//
//  Model.swift
//  VK
//
//  Created by marinapolyakova on 01.04.2023.
//

import Foundation

struct FriendResponse : Decodable{
    var response : Friends
}

struct Friends : Decodable{
    var items : [Friend]
}

struct Friend : Decodable, Hashable{
    var firstName: String
    var lastName : String
    var photo : String
    
    enum CodingKeys : String, CodingKey{
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
    }
}
