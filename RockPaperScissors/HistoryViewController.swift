//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Peter Evans on 3/30/15.
//  Copyright (c) 2015 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var history = [RPSMatch]()
    let cellReuseIdentifier = "HistoryReuseIdentifier"

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCellWithIdentifier(self.cellReuseIdentifier) as UITableViewCell
        
        // test again to see the result of each historical match and then print the results accordingly
        if history[indexPath.row].p1 == history[indexPath.row].p2 {
            cell.textLabel?.text = "It was a tie"
            cell.detailTextLabel?.text = history[indexPath.row].p1.description + " vs. " + history[indexPath.row].p2.description
        }
        else {
            cell.textLabel?.text = resultString(history[indexPath.row])
            cell.detailTextLabel?.text = history[indexPath.row].p1.description + " vs. " + history[indexPath.row].p2.description
        }
        
        return cell
    }
    
    //reused function from RockPaperScissorsViewController
    func resultString(match: RPSMatch) -> String {
        return match.p1.defeats(match.p2) ? "Win!" : "Loss!"
    }

}
