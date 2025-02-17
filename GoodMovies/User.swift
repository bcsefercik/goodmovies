import Foundation
import UIKit
struct User{
    let uid: String
    let username: String
    let name: String
    var willWatchCount: Int
    var didWatchCount: Int
    var followerCount: Int
    let followingCount: Int?
    var picture: NSURL?
    var fgColor: String
    var bgColor: String
    var email: String
    
    init(uid: String, username: String, name: String, willWatchCount: Int, didWatchCount: Int, followerCount: Int?, followingCount: Int?, picture: String, foregroundColor: String, backgroundColor: String, email: String){
        self.uid = uid
        self.username = username
        self.name = name
        self.willWatchCount = willWatchCount
        self.didWatchCount = didWatchCount
        if followerCount == nil {
            self.followerCount = 0
        } else {
            self.followerCount = followerCount!
        }
        self.followingCount = followingCount
        self.picture = NSURL(string: picture)!
        self.fgColor = foregroundColor
        if self.fgColor == "" {
            self.fgColor = "0,0,0"
        }
        self.bgColor = backgroundColor
        if self.bgColor == "" {
            self.bgColor = "255,255,255"
        }
        
        self.email = email
    }
    
    init(uid: String, username: String, name: String, willWatchCount: Int, didWatchCount: Int, followerCount: Int?, followingCount: Int?, picture: String){
        self.init(uid: uid, username: username, name: name, willWatchCount: willWatchCount, didWatchCount: didWatchCount, followerCount: followerCount, followingCount: followingCount, picture: picture, foregroundColor: "", backgroundColor: "", email: "")
    }
    
    mutating func changeFollowerCount(by: Int){
        followerCount += by
    }
    
    mutating func changeMovieCount(by: Int, type: MovieStatus){
        switch type {
        case .willWatch:
            willWatchCount += by
        default:
            didWatchCount += by
        }
    }
    
    mutating func changePicture(picture: String){
        self.picture = NSURL(string: picture)!
    }
}

struct UserSimple : Equatable{
    let name, username, uid: String
    let picture: NSURL?
    
    init(name: String, username: String, uid: String, picture: String){
        self.name = name
        self.username = username
        self.uid = uid
        self.picture = NSURL(string: picture)!
    }
}

func == (lhs: UserSimple, rhs: UserSimple) -> Bool{
    return lhs.uid == rhs.uid
}

struct UserConstants{
    static let currentUserID = "currentUserID"
}