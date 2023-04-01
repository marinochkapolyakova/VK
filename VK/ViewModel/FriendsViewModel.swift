//
//  FriendsViewModel.swift
//  VK
//
//  Created by marinapolyakova on 01.04.2023.
//

import Foundation
import Alamofire

class FriendsViewModel: ObservableObject{
    
    func getFriends(token: String, completion: @escaping([Friend])->()){
        let url = "https://api.vk.com/method/friends.get"
        
        let params: Parameters = [
            "access_token" : token,
            "fields" : "photo_50",
            "v" : "5.131"
        ]
        
        AF.request(url, method: .post, parameters: params).response { result in
            if let data = result.data {
                if let friends = try? JSONDecoder().decode(FriendResponse.self, from: data).response.items{
                    completion(friends)
                }
            }
            
        }
        
    }
    
}
