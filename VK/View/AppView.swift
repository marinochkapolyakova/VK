//
//  AppView.swift
//  VK
//
//  Created by marinapolyakova on 01.04.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct AppView: View {
    @EnvironmentObject var loginViewModel : LoginViewModel
    @ObservedObject var friendsViewModel = FriendsViewModel()
    @State var friends = [Friend]()
    var body: some View {
        ZStack{
            ScrollView(.vertical){
                LazyVStack{
                    VStack{
                        ForEach(friends, id: \.self) { friend in
                            FriendItem(name: friend.firstName, surName: friend.lastName, photo: friend.photo)
                        }
                        
                    }.padding()
                }
            }
            .padding(.top, 50)
            .onAppear{
                friendsViewModel.getFriends(token: loginViewModel.token) { friends in
                    self.friends = friends
                }
            }
        }
    }
    
    
    struct FriendItem : View{
        
        var name : String
        var surName : String
        var photo : String
        
        var body: some View{
            HStack{
                WebImage(url: URL(string: photo))
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading){
                    Text(name)
                        .font(.system(size: 18, weight: .black))
                    Text(surName)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    struct AppView_Previews: PreviewProvider {
        static var previews: some View {
            AppView()
        }
    }
}
