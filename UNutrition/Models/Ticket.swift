//
//  Ticket.swift
//  UNutrition
//
//  Created by Nathaniel Parry Luff on 11/11/23.
//

import Foundation
import RealmSwift


class Ticket: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var product: String
    @Persisted var title: String
    @Persisted var details: String?
    @Persisted var author: String
    @Persisted var created = Date()
    @Persisted var status = TicketStatus.notStarted
    
    enum TicketStatus: String, PersistableEnum {
        case notStarted, inProgress, complete
    }
}
