//
//  CreditsVC.swift
//  Holidario
//
//  Created by Tadreik Campbell on 12/30/19.
//  Copyright © 2019 Tadreik Campbell. All rights reserved.
//

import UIKit
import Firebase

class CreditsVC: UITableViewController {
    
    var people: [Person] = [Person]()
    var database: Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        addPeople()
    }
    
    func addPeople() {
        tableView.reloadData()
        database = Firestore.firestore()
        database.collection("people").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let docRef = self.database.collection("people").document(document.documentID)
                    docRef.getDocument { (document, _) in
                        if let person = document.flatMap({
                            $0.data().flatMap({ (data) in
                                return Person(dictionary: data)
                            })
                        }) {
                            self.people.append(person)

                        } else {
                            print("Document does not exist")
                        }
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        openUrl(at: indexPath)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonCell
        let person = people[indexPath.row]
        cell.itemLabel.text = person.item
        cell.nameLabel.text = person.name
        return cell
    }
    
    func openUrl(at indexPath: IndexPath) {
        let selectedCell = people[indexPath.row]
        
        UIApplication.shared.open(NSURL(string: selectedCell.url!)! as URL, options: [:], completionHandler: nil)
    }

}
