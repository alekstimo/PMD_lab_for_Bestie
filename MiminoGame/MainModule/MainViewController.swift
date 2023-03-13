//
//  MainViewController.swift
//
//
//  Код через таблицы но сюда смотреть не надо Дима!!!!
//

import UIKit
struct Card {
    
    var isSelected = false
    var title: String
    var isGuessed = false
    var id = 0
    
}


class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedCard = -1
    var model: Array<Card> = [Card(title: "😈"),Card(title: "🤡"),Card(title: "🤩"),Card(title: "💩"),Card(title: "🤩"),Card(title: "🤡"),Card(title: "😈"),Card(title: "💩")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    private func configure() {
       
      //  tableViewTopConstraint.constant = addButton.frame.minY
       
       // tableViewTopConstraint.constant = self.view.frame.minY

       // tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UINib(nibName: "\(MainTableViewCell.self)", bundle: .main),
                           forCellReuseIdentifier: "\(MainTableViewCell.self)")
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.rowHeight = 50
        //tableView.scrollsToTop = false
    
        //tableView.separatorStyle = .none
        navigationItem.title = "Игра"
        
       // NotificationCenter.default.addObserver(self, selector: #selector(addNewTask), name: NSNotification.Name("addNewTask"), object: nil)
       
    }
   
    func compare(index1: Int, index2: Int ){
        
        if model[index1].title == model[index2].title {
            model[index1].isGuessed = true
            model[index2].isGuessed = true
        } else {
            model[index1].isSelected = false
            model[index2].isSelected = false
        }
        selectedCard = -1
        tableView.reloadData()
    }
   

}
// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "\(MainTableViewCell.self)")
        if model[indexPath.row].isSelected || model[indexPath.row].isGuessed {
            if let cell = cell as? MainTableViewCell {
                cell.title = model[indexPath.row].title
            }
        } else {
            if let cell = cell as? MainTableViewCell {
                cell.title = "?"
            }
        }
    return cell ?? UITableViewCell()
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard selectedCard > 0 else {
            if model[indexPath.row].isGuessed {
                return
            }
            model[indexPath.row].isSelected = true
            selectedCard = indexPath.row
            tableView.reloadData()
            return
        }
        model[indexPath.row].isSelected = true
        tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){ [self] in
            compare(index1: indexPath.row, index2: selectedCard)
        }
    }

}

