//
//  PetsViewController.swift
//  SampleApp2
//
//  Created by Salvo, Pete on 10/17/15.
//  Copyright © 2015 Pete Salvo. All rights reserved.
//

import UIKit

class PetsViewController: UITableViewController {

    var _detailViewController: PetDetailViewController? = nil
    var _petManager : PetManager = PetManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self._detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? PetDetailViewController
        }
        
        
        self.showFullScreenModalActivityIndicator()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addNewPet:")
        _petManager.downloadPets { () -> Void in
            print("Done downloading pets")
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
                self.navigationItem.rightBarButtonItem = addButton
                self.hideFullScreenModalActivityIndicator()
            })
            
        }

    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addNewPet(sender: AnyObject) {
        
        let pet : Pet = RandomPet.random()
        
        _petManager.addPet(pet) { () -> Void in
            let indexPath = NSIndexPath(forRow: self._petManager.petCount - 1, inSection: 0)
            
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPetDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let pet = _petManager.petAtIndex(indexPath.row)
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! PetDetailViewController
                controller.petDetail = pet
                controller.actionToPerformWhenPetSaved = {
                    self._petManager.replacePetAtIndex(indexPath.row, pet: controller.petDetail!)
                    self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                }
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _petManager.petCount
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let pet = _petManager.petAtIndex(indexPath.row)
        let cell = tableView.dequeueReusableCellWithIdentifier("PetCellIdentifier", forIndexPath: indexPath) as! PetCell
        cell.setPet(pet)

        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            _petManager.removePetAtIndex(indexPath.row, closure: { () -> Void in
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            })
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

