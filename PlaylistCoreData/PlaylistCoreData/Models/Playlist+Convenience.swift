//
//  Playlist+Convenience.swift
//  PlaylistCoreData
//
//  Created by Jackson Tubbs on 8/7/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation
import CoreData

extension Playlist {
    
    @discardableResult // IDK WHY, BUT KARL SAID TO
    convenience init(playlistName: String, song: [Song] = [], moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        
        self.playlistName = playlistName
    }
}
