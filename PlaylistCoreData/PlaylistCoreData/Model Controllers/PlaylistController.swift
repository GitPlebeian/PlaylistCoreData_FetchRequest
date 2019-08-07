//
//  PlaylistController.swift
//  PlaylistCoreData
//
//  Created by Jackson Tubbs on 8/7/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let shared = PlaylistController()
    
    // Local Source of truth
    var playlists: [Playlist] {
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    // MARK: - CRUD
    
    //Create
    func createPlaylist(withName name: String) {
        Playlist(playlistName: name)
        // Save
        saveToPersistentStore()
    }
    
    // Delete
    func deletePlaylist(playlist: Playlist) {
        CoreDataStack.context.delete(playlist)
        // Save
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error saving the objects in \(#function): \(error.localizedDescription)")
        }
    }
}
