//
//  GotixEventsModel.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 28/06/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import Foundation
import SwiftyJSON

struct GotixEventsModel {
    var event_id: Int?
    var name: String?
    var image: String?
    var description: String?
    var rating: EventRatingEnum = EventRatingEnum.None
    var tag: [ TagModel ] = []
    var date: String?
    var date_timestamp: Int?
    var lowest_available_price: Double?
    var location: String?
    var status: EventStatusEnum = EventStatusEnum.None
    var is_featured: Bool?
    var is_hot_deals: Bool?
    var discount_status: Bool?
    var discount_price: Double?
    var categories: [ CategoriesModel ] = []
    var featured_events: [ FeaturedEventsModel ] = []
    var category_id: Int?
    var path: String?
    
    init(json: JSON) {
        self.event_id = json["event_id"].intValue
        self.name = json["name"].stringValue
        self.image = json["image"].stringValue
        self.description = json["description"].stringValue
        
        self.rating = EventRatingEnum.ratingFromString(json["rating"].stringValue)
        
        for tag in json["tag"].arrayValue {
            let tag = TagModel(name: tag.stringValue)
            self.tag.append(tag)
        }
        
        self.date = json["date"].stringValue
        self.date_timestamp = json["date_timestamp"].intValue
        self.lowest_available_price = json["lowest_available_price"].doubleValue
        self.location = json["location"].stringValue
        
        self.status = EventStatusEnum.statusFromString(json["status"].stringValue)
        
        self.is_featured = json["is_featured"].boolValue
        self.is_hot_deals = json["is_featured"].boolValue
        self.discount_status = json["discount_status"].boolValue
        self.discount_price = json["discount_price"].doubleValue
        
        for categories in json["categories"].arrayValue {
            let categories = CategoriesModel(name: categories.stringValue)
            self.categories.append(categories)
        }
        
        for (_,featured_events) in json["featured_events"] {
            let featured_events = FeaturedEventsModel(json: featured_events)
            self.featured_events.append(featured_events)
        }
        
        self.category_id = json["category_id"].intValue
        self.path = json["path"].stringValue
    }
}

struct FeaturedEventsModel {
    var event_id: Int?
    var name: String?
    var image: String?
    var featured: Bool?
    
    init(json: JSON) {
        self.event_id = json["event_id"].intValue
        self.name = json["name"].stringValue
        self.image = json["image"].stringValue
        self.featured = json["featured"].boolValue
    }
}

struct TagModel {
    var name: String?
    
    init(name: String?) {
        self.name = name
    }
}

struct CategoriesModel {
    var name: String?
    
    init(name: String?) {
        self.name = name
    }
}

enum EventRatingEnum: String {
    case None = "no_image"
    case overThirteen = "gtx-rating-13+"
    case overSeventeen = "gtx-rating-17+"
    case SU = "gtx-rating-SU"
    case R = "gtx-rating-R"
    case D = "gtx-rating-D"
    
    static func ratingFromString(string: String) -> EventRatingEnum {
        
        switch(string) {
            
        case "13+": return .overThirteen
        case "17+": return .overSeventeen
        case "SU": return .SU
        case "R": return .R
        case "D": return .D
            
        default: return .None
        }
    }
}

enum EventStatusEnum {
    case None, Incoming, TicketReady, Canceled, Postponed
    
    static func statusFromString(string: String) -> EventStatusEnum {
        
        switch(string) {
            
        case "incoming": return .Incoming
        case "ticket_ready": return .TicketReady
        case "canceled": return .Canceled
        case "postponed": return .Postponed
            
        default: return .None
        }
    }
}