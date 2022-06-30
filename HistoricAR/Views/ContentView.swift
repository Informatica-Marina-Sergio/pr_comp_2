import Foundation
import SwiftUI

struct Category {
    let city: String
    let items: [String]
}

class ContentViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let data: [Category] = [
        Category(city: "Madrid", items: ["UC3M", "El Retiro", "Parque de Andalucía", "Parque de Alcobendas"]),
        Category(city: "Toledo", items: ["Zocodover", "El Alcázar", "La Catedral", "Puerta Bisagra"]),
        Category(city: "Miguel Esteban", items: ["Castillo Novo", "Prado inicial"]),
        Category(city: "Fuengirola", items: ["Castillo de la Luz", "Plaza de la Paz"]),
        Category(city: "Viveiro", items: ["Plaza Mayor", "Puerto"]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.separatorColor = UIColor(hex:0x56C271)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.backgroundColor = .white
        tableView.frame = view.bounds
    }
}

extension ContentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let category = data[indexPath.row]
        let vc = ListViewController(items: category.items)
        vc.title = category.city
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ContentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].city
        return cell
    }
    
}

