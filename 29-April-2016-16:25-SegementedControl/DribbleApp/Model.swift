//
//  Model.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 19/05/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit
import SwiftyJSON

class Model: NSObject {
    
    var created_at: String?
    var follower: [ Follower ]?
    var id: Int?
    
    internal func configureJSON(json: JSON) {
        self.created_at = json["created_at"].stringValue
        self.id = json["id"].intValue
        
        self.configureJSONFollower(json["follower"])
    }
    
    private func configureJSONFollower(json: JSON) {
        
        for (_, data) in json {
            let follower_: Follower = Follower()
                follower_.configureJSON(data)
            follower?.append(follower_)
        }
        
    }
    
}

class Follower: NSObject {
    
    var avatar_url: String?
    var bio: String?
    var buckets_count: Int?
    var buckets_url: String?
    var can_upload_shot: Bool?
    var comments_received_count: Int?
    var created_at: String?
    var followers_count: Int?
    var followers_url: String?
    var following_url: String?
    var followings_count: Int?
    var html_url: String?
    var id: Int?
    var likes_count: Int?
    var likes_received_count: Int?
    var likes_url: String?
    var links: [ Links ]?
    var location: String?
    var name: String?
    var pro: Int?
    var projects_count: Int?
    var projects_url: String?
    var rebounds_received_count: Int?
    var shots_count: Int?
    var shots_url: String?
    var teams_count: Int?
    var teams_url: String?
    var type: String?
    var updated_at: String?
    var username: String?
    
    private func configureJSON(json: JSON) {
        self.avatar_url = json[""].stringValue
        self.bio = json[""].stringValue
        self.buckets_count = json[""].intValue
        self.buckets_url = json[""].stringValue
        self.can_upload_shot = json[""].boolValue
        self.comments_received_count = json[""].intValue
        self.created_at = json[""].stringValue
        self.followers_count = json[""].intValue
        self.followers_url = json[""].stringValue
        self.following_url = json[""].stringValue
        self.followings_count = json[""].intValue
        self.html_url = json[""].stringValue
        self.id = json[""].intValue
        self.likes_count = json[""].intValue
        self.likes_received_count = json[""].intValue
        self.likes_url = json[""].stringValue
        self.location = json[""].stringValue
        self.name = json[""].stringValue
        self.pro = json[""].intValue
        self.projects_count = json[""].intValue
        self.projects_url = json[""].stringValue
        self.rebounds_received_count = json[""].intValue
        self.shots_count = json[""].intValue
        self.shots_url = json[""].stringValue
        self.teams_count = json[""].intValue
        self.teams_url = json[""].stringValue
        self.type = json[""].stringValue
        self.updated_at = json[""].stringValue
        self.username = json[""].stringValue
//        self.avatar_url = json[""].stringValue
    }
    
}

class Links: NSObject {
    
    private func configureJSON(json: JSON) {
        
    }
}