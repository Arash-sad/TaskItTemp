//
//  ViewController.swift
//  TaskIt
//
//  Created by Arash Sadeghieh E on 24/09/2014.
//  Copyright (c) 2014 Arash Sadeghieh Eshtehadi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var taskArray:[TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let task1 = TaskModel(task: "Study French", subtask: "Verbs", date: "01/14/2014")
        let task2 = TaskModel(task: "Eat Dinner", subtask: "Burgers", date: "01/13/2014")
        let task3 = TaskModel(task: "Gym", subtask: "Leg Day", date: "01/14/2014")
        taskArray = [task1, task2, task3]
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        let thisTask = taskArray[indexPath.row]
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        cell.dateLabel.text = thisTask.date
        
        return cell
    }
    //UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        println("\(indexPath.row)")
        self.performSegueWithIdentifier("showTaskDetail", sender: self)
        
    }


}

