//
//  GotixEventsViewModel.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 28/06/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import Foundation
import SwiftyJSON

struct GotixEventsViewModel {
    
    var gotixEventsModel: [ GotixEventsModel ]? = [] {
        didSet {
            
        }
    }
    
    var gotixHodealsModel: [ GotixEventsModel ]? = [] {
        didSet {
            
        }
    }
    
    init() {
        self.parseJSON()
    }
    
    private mutating func parseJSON() {
        if let path = NSBundle.mainBundle().pathForResource("list_event_by_category", ofType: "json") {
            do {
                let data = try(NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe))
                let jsonDictionary = try(NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers))
                
//                if let eventDictionary = jsonDictionary["data"] as? [String: AnyObject] {
//                    self.gotixEventsModel?.append(GotixEventsModel(json: JSON(eventDictionary)))
//                }
                
                if let eventDictionary = jsonDictionary["data"] as? [[String: AnyObject]] {
                    for eventDictionary in eventDictionary {
                        self.gotixEventsModel?.append(GotixEventsModel(json: JSON(eventDictionary)))
                    }
                }
                print(String(jsonDictionary))
            } catch let err {
                print(err)
            }
        }
        
        if let path = NSBundle.mainBundle().pathForResource("list_hot_deals_events", ofType: "json") {
            do {
                let data = try(NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe))
                let jsonDictionary = try(NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers))
                
                if let eventDictionary = jsonDictionary["data"] as? [[String: AnyObject]] {
                    for eventDictionary in eventDictionary {
                        self.gotixHodealsModel?.append(GotixEventsModel(json: JSON(eventDictionary)))
                    }
                }
                print(String(jsonDictionary))
            } catch let err {
                print(err)
            }
        }
    }
}