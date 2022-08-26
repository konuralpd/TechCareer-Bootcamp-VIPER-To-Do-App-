//
//  EditToDoViewController.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//

import UIKit

class EditToDoViewController: UIViewController {
    @IBOutlet weak var editTextView: UITextView!
    
    var toDo0: toDo?
    
    var editToDoPresenterObject: ViewToPresenterEditToDoProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let td = toDo0?.todo_text {
            editTextView.text = td
        }
        
        EditToDoRouter.createModule(ref: self)

    }
    
    @IBAction func editButtonClicked(_ sender: UIButton) {
        if let etf = editTextView.text, let td = toDo0 {
            editToDoPresenterObject?.update(todo_id: td.todo_id! , todo_text: etf)
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
   
    
  

}
