//
//  SongListTableViewController.swift
//  PlaylistCoreData
//
//  Created by Jackson Tubbs on 8/7/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    
    
    // MARK: - Properties
    
    var playlist: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Acitons
    @IBAction func addSongButtonTapped(_ sender: Any) {
        guard let songName = songNameTextField.text, let artistName = artistNameTextField.text, let playlist = playlist else {return}
        if songName.isEmpty || artistName.isEmpty {return}
        
        SongController.createSong(songName: songName, songArtist: artistName, playlist: playlist)
        
        // Clean of dust
        songNameTextField.text = ""
        artistNameTextField.text = ""
        tableView.reloadData()
    }
    
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.songs?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        guard let playlist = playlist, let song = playlist.songs?[indexPath.row] as? Song else {return UITableViewCell()}
        
        cell.textLabel?.text = song.trackName
        cell.detailTextLabel?.text = song.artist

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            guard let playlist = playlist, let song = playlist.songs?[indexPath.row] as? Song else {return}
            SongController.deleteSong(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
