//
//  TaskCell.swift
//  TODO-list
//
//  Created by Мария Цуканова on 07.09.2024.
//

import UIKit

//работа с ячейкой

class TaskCell: UITableViewCell {

    @IBOutlet weak var someTask: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    weak var removeTaskDelegate: RemoveTaskDelegate?
    
    weak var taskCompletedDelegate: TaskCompletedDelegate?
    
    var task: TaskModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellData(task: TaskModel) {
        someTask.text = task.taskName
        viewCell.backgroundColor = task.taskCellColor
        self.task = task
    }
    
    @IBAction func removeTaskBtnPressed(_ sender: Any) {
        guard let task = task else { return }
        removeTaskDelegate?.removeTask(task: task)
       
        
    }
    
    @IBAction func executeTaskBtnPressed(_ sender: Any) {
        guard let task = task else { return }
        taskCompletedDelegate?.taskComplet(task: task)
    }
    
}
