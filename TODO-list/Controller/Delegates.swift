//
//  Delegates.swift
//  TODO-list
//
//  Created by Мария Цуканова on 07.09.2024.
//

import Foundation

protocol SaveUserTaskDelegate: AnyObject {
    func saveTask(task: TaskModel)
}

protocol RemoveTaskDelegate: AnyObject {
    func removeTask(task: TaskModel)
}

protocol TaskCompletedDelegate: AnyObject {
    func taskComplet(task: TaskModel)
}


