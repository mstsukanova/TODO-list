//
//  TaskVC.swift
//  TODO-list
//
//  Created by Мария Цуканова on 07.09.2024.
//

import UIKit

class TaskVC: UIViewController {
    
    // ввод и сохранение задачи

    weak var saveTaskDelegate: SaveUserTaskDelegate?
    @IBOutlet weak var userTaskField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func saveTaskBtnPressed(_ sender: Any) {
        if let task = userTaskField.text {
            if !task.isEmpty {
                let task = TaskModel(taskName: task, taskCellColor: .white)
                saveTaskDelegate?.saveTask(task: task)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
}
