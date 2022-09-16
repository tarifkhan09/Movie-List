//
//  ViewController.swift
//  Task_Job
//
//  Created by MD Tarif khan on 31/5/22.
//

import UIKit

class ViewController: UIViewController {

    var dataList = [Result]()

    @IBOutlet weak var tableVewUser: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fatchData()
    }

    
    ///table view connection.
    func setup(){
        tableVewUser.delegate = self
        tableVewUser.dataSource = self
        let nib = UINib(nibName: "UserTableCell", bundle: nil)
        tableVewUser.register(nib, forCellReuseIdentifier: "UserTableCell")
    }
    
    
    //MARK: Fatch API Data.
    func fatchData(){
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://api.themoviedb.org/3/search/movie?api_key=38e61227f85671163c275f9bd95a8803&query=marvel")!)) {
            (data,req,err) in

            do{
                let result = try JSONDecoder().decode(MoviesResult.self, from: data!)
                DispatchQueue.main.async {

                    print("====== rrrrrrrrrr ==== \(result.results)")

                    self.dataList = result.results
                    self.tableVewUser.reloadData()
                }

            } catch {
                
            }

        }.resume()
    }
}

//MARK: TableView Datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVewUser.dequeueReusableCell(withIdentifier: "UserTableCell", for: indexPath) as! UserTableCell
        
        cell.configuration(data: dataList[indexPath.row])
        return cell
    }
}

