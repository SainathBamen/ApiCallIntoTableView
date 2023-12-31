//
//  ViewController.swift
//  ApiCallIntoATableView
//swiftwithyash.
//
//  Created by Sainath Bamen on 16/05/23.
//

import UIKit

class ViewController: UIViewController {
    var heroes = [HeroStats]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON {
            self.tableView.reloadData()
            print("success")
        }
        
    }
    
    func downloadJSON(completed: @escaping ()->()){
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil{
                do{
                    self.heroes = try JSONDecoder().decode([HeroStats].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }

                }catch{
                    print("error ")
                }
                            }
        }.resume()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let hero = heroes[indexPath.row]
        cell.textLabel?.text = hero.localized_name.capitalized
        cell.detailTextLabel?.text = hero.primary_attr.capitalized
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetali", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? HeroViewController{
            destination.hero = heroes[tableView.indexPathForSelectedRow!.row]
        }
            
            
    }
    
    
    
}

