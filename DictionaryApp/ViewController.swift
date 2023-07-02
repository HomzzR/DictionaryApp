//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Артем Калюжин on 02.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let words = ["Apple", "Pear", "Watermelon", "Carrot", "Potato", "Tomato"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell.textLabel?.text = words[indexPath.row]
        
        return cell
    }
}

