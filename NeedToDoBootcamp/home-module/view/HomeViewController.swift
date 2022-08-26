//
//  HomeViewController.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toDoTableView: UITableView!
    
    var todoList = [toDo]()
    
    var homePresenterObject: ViewToPresenterHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        searchBar.delegate = self
        
        copyDatabase()
        
        HomeRouter.createModule(ref: self)
        
        
       
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        homePresenterObject?.getData()
    }
    
    
    @IBAction func addNewButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toNewToDoVC", sender: nibName)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewToDoVC" {
            //No need to carry data because there's no data :)
        }
        
        if segue.identifier == "toEditToDoVC" {
            let toDo0 = sender as? toDo
            let destinationVC = segue.destination as! EditToDoViewController
            destinationVC.toDo0 = toDo0
            
        }
    }
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "todo", ofType: ".db")
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: destinationPath).appendingPathComponent("todo.db")
        let fm = FileManager.default
        if fm.fileExists(atPath: copyPath.path) {
            print("Database already exist!")
        } else {
            do {
                try fm.copyItem(atPath: bundlePath!, toPath: copyPath.path)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    

}

extension HomeViewController: PresenterToViewHomeProtocol {
    func sendDataToView(toDoList: Array<toDo>) {
        self.todoList = toDoList
        self.toDoTableView.reloadData()
        
    }
    
    
}

extension HomeViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homePresenterObject?.search(word: searchText)
    }
}

extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo0 = todoList.reversed()[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! ToDoCell
        cell.toDoLabel.text = toDo0.todo_text
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo0 = todoList.reversed()[indexPath.row]
        performSegue(withIdentifier: "toEditToDoVC", sender: toDo0)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ [self] (contextualAction,view,bool) in
            let toDo0 = todoList.reversed()[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "\(toDo0.todo_text!) going to delete?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.homePresenterObject?.delete(todoID: toDo0.todo_id!, index: indexPath)
            }
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
