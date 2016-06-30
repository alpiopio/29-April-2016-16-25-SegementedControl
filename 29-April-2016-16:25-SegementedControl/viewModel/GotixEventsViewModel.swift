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
            print(self.gotixEventsModel?.first?.featured_events.count)
        }
    }
    
    init() {
        self.parseJSON()
    }
    
    private mutating func parseJSON() {
        if let path = NSBundle.mainBundle().pathForResource("list_home_page_data", ofType: "json") {
            do {
                let data = try(NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe))
                let jsonDictionary = try(NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers))
                
                if let eventDictionary = jsonDictionary["data"] as? [String: AnyObject] {
                    self.gotixEventsModel?.append(GotixEventsModel(json: JSON(eventDictionary)))
                }
                
//                if let eventDictionary = jsonDictionary["data"] as? [[String: AnyObject]] {
//                    for eventDictionary in eventDictionary {
//                        self.gotixEventsModel?.append(GotixEventsModel(json: JSON(eventDictionary)))
//                    }
//                }
                print(jsonDictionary)
            } catch let err {
                print(err)
            }
        }
    }
}