//
//  TaskListTVC.swift
//  TODO-list
//
//  Created by Мария Цуканова on 07.09.2024.
//

import UIKit

class TaskListTVC: UITableViewController {
    
    var vc = TaskVC()
   
    // создание массива
    
    var arrayUserTasks = [TaskModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // формирование таблицы
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUserTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskCell else { return UITableViewCell() }
        arrayUserTasks[indexPath.row].currentIndex = indexPath
        let task = arrayUserTasks[indexPath.row]
        cell.cellData(task: task)
        cell.removeTaskDelegate = self
        cell.taskCompletedDelegate = self
        return cell
    }
    
    
    @IBAction func showTaskVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "TaskVC") as! TaskVC
        vc.saveTaskDelegate = self
        present(vc, animated: true, completion: nil)
    }
    
}

// действия с задачами

extension TaskListTVC: SaveUserTaskDelegate {
   func saveTask(task: TaskModel) {
       arrayUserTasks.append(task)
       tableView.reloadData()
   }
}

extension TaskListTVC: RemoveTaskDelegate {
    func removeTask(task: TaskModel) {
        guard let taskByIndex = task.currentIndex?.item else { return }
        arrayUserTasks.remove(at: taskByIndex)
        tableView.reloadData()
    }
}

extension TaskListTVC: TaskCompletedDelegate {
    func taskComplet(task: TaskModel) {
        guard let taskByIndex = task.currentIndex?.item else { return }
        arrayUserTasks[taskByIndex].taskCellColor = #colorLiteral(red: 0.4666666667, green: 0.7607843137, blue: 0.7019607843, alpha: 1)
        tableView.reloadData()
    }
}

