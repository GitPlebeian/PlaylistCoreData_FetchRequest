//
//  SongController.swift
//  PlaylistCoreData
//
//  Created by Jackson Tubbs on 8/7/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    // MARK: - CRUD
    
    // Create
    static func createSong(songName: String, songArtist: String, playlist: Playlist) {
        Song(trackName: songName, artist: songArtist, playlist: playlist)
        PlaylistController.shared.saveToPersistentStore()
    }
    
    // Delete
    static func deleteSong(song: Song) {
        CoreDataStack.context.delete(song)
        PlaylistController.shared.saveToPersistentStore()
    }
    
}
