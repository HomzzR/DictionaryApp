//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Артем Калюжин on 02.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let words = [
        ["Apple", "Pear", "Watermelon"],
        ["Carrot", "Pickle", "Potato", "Tomato"]
    ]
    
    let headers = ["Fruits", "Vegetables"]
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.sectionHeaderHeight = 32
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vegOrFruitArray = words[section]
        return vegOrFruitArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        var content = cell.defaultContentConfiguration()
        content.text = words[indexPath.section][indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
}

extension UIViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let words = [
            ["Apple", "Pear", "Watermelon"],
            ["Carrot", "Pickle", "Potato", "Tomato"]
        ]
        let alert = UIAlertController(title: nil,
                                      message: "Вы нажали на: \(words[indexPath.section][indexPath.row])",
                                      preferredStyle: .alert)                         
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            alert.dismiss(animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
