//
//  TableViewControllerGraphics.swift
//  ExamenIOS
//
//  Created by Guillermo Saavedra Dorantes on 12/02/21.
//

import UIKit

class TableViewControllerGraphics: UITableViewController {
    
    var jsonInfo: JSON?
    

    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        getJson()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return jsonInfo?.questions.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "charts", for: indexPath) as! TableViewCellGraphics

        // Configure the cell...
        if let cellInfo = jsonInfo?.questions[indexPath.row] {
            cell.setInfo(chartData: cellInfo.chartData, title: cellInfo.text, hexC: jsonInfo?.colors ?? [])
        }
        

        return cell
    }
    
    func getJson() {
        guard let url = URL(string: "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    print(json)
                    let info: JSON = try! JSONDecoder().decode(JSON.self, from: data)
                    self.jsonInfo = info
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
