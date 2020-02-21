//
//  MovieTableViewController.swift
//  TableViewTest
//
//  Created by mikewang on 2020/2/20.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    let romanceMovies = [
        Movie(name: "生命中的美好缺憾", actor: "pic1", year: 2014),
        Movie(name: "真愛每一天", actor: "pic2", year: 2013),
        Movie(name: "手札情緣", actor: "pic3", year: 2004)]
    
    let actionMovies = [
        Movie(name: "玩命關頭3:東京甩尾", actor: "韓哥", year: 2006),
        Movie(name: "玩命關頭2:飆風再起", actor: "布萊恩", year: 2003),
        Movie(name: "玩命關頭1", actor: "唐老大", year: 2001)
    ]
    
    struct propertyKeys {
        static let movieCell = "movieCell"
    }
    
    var dataSource: UITableViewDiffableDataSource<Section, Movie>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = UITableViewDiffableDataSource<Section, Movie>(tableView: tableView, cellProvider: { (tableView, indexPath, movie) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: propertyKeys.movieCell, for: indexPath) as! MovieTableViewCell
            cell.nameLabel.text = movie.name
            cell.yearLabel.text = movie.year.description
            cell.coverImageView.image = UIImage(named: movie.actor)
            cell.coverImageView.clipsToBounds = true
            cell.coverImageView.layer.cornerRadius = 10
            return cell
        })
        tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Movie>()
        snapshot.appendSections([.action, .romance])
        snapshot.appendItems(actionMovies, toSection: .action)
        snapshot.appendItems(romanceMovies, toSection: .romance)
        dataSource.apply(snapshot, animatingDifferences: false)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let controller = segue.destination as? MovieDetailViewController
            
            controller?.movie = dataSource.itemIdentifier(for: indexPath)
        }
    }
    
}
