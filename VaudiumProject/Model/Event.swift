//
//  EventModel.swift
//  VaudiumProject
//
//  Created by 이보한 on 2024/4/19.
//

import Foundation
import SwiftData

struct Event {
  let id: UUID
  var title: String
  var startDate: Date
  var endDate: Date
//  var location: String?
  var eventDescription: String?
  var attendees: [String]?
  
  init(id: UUID, 
       title: String,
       startDate: Date,
       endDate: Date,
//       location: String? = nil,
       eventDescription: String? = nil,
       attendees: [String]? = nil) {
    self.id = id
    self.title = title
    self.startDate = startDate
    self.endDate = endDate
//    self.location = location
    self.eventDescription = eventDescription
    self.attendees = attendees
  }
}
