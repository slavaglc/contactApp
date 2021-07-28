//
//  ContactListViewController.swift
//  contactApp
//
//  Created by slava on 27.07.2021.
//

import UIKit

class ContactListViewController: UITableViewController {
    var persons = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.shared.generateData(count: 14)
        persons = DataManager.shared.persons
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        detailVC.person = sender as? Person
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let person = persons[indexPath.row]
        cell.textLabel?.text = "\(person.name) \(person.surname)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: persons[indexPath.row])
    }
    
}
