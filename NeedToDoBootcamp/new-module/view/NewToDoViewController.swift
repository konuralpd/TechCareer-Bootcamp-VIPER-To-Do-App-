//
//  NewToDoViewController.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//

import UIKit

class NewToDoViewController: UIViewController {
    @IBOutlet weak var toDoTextField: UITextView!
    
    var newToDoPresenterObject :ViewToPresenterNewToDoProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        NewToDoRouter.createModule(ref: self)
        
       
        
        
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        if let tn = toDoTextField.text {
            newToDoPresenterObject?.add(todo_text: tn)
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
   
}
