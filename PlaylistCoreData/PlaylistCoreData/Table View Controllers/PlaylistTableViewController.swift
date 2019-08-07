//
//  PlaylistTableViewController.swift
//  PlaylistCoreData
//
//  Created by Jackson Tubbs on 8/7/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var playlistTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Actions
    
    @IBAction func createPlaylistButtonTapped(_ sender: Any) {
        guard let playlistName = playlistTextField.text else {return}
        if playlistName.isEmpty {return}
        PlaylistController.shared.createPlaylist(withName: playlistName)
        tableView.reloadData()
        // Clean up dust
        playlistTextField.text = ""
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.shared.playlists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)

        let playlist = PlaylistController.shared.playlists[indexPath.row]
        let songCount = playlist.songs?.count ?? 0
        
        cell.textLabel?.text = playlist.playlistName
        cell.detailTextLabel?.text = "\(songCount)"
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            PlaylistController.shared.deletePlaylist(playlist: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlaylist" {
            guard let index = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? SongListTableViewController else {return}
            
            let playlist = PlaylistController.shared.playlists[index.row]
            destinationVC.playlist = playlist
            
        }
    }
}
