//
//  ViewController.swift
//  To Do List
//
//  Created by Dingnan Zhou on 9/26/17.
//  Copyright © 2017 Dingnan Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var toDoArray = ["Learn Swift", "Build Apps", "Change the World!"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
          tableView.delegate = self
          tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "EditItem" {
            let destination = segue.destination as!
            DetailViewController
            let index =  tableView.indexPathForSelectedRow!.row
            destination.toDoItem = toDoArray[index]
        }
    }
    @IBAction func unwindFromDetailViewController(seque: UIStoryboardSegue){
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = toDoArray[indexPath.row]
        return cell
   }
}

