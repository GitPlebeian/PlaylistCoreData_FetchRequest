//
//  Song+Convenience.swift
//  PlaylistCoreData
//
//  Created by Jackson Tubbs on 8/7/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation
import CoreData

extension Song {
    
    convenience init(trackName: String, artist: String, playlist: Playlist, moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        self.trackName = trackName
        self.artist = artist
        self.playlist = playlist
    }
}
