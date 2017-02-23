//
//  ViewController.swift
//  CollectionInTable
//
//  Created by Adi Nugroho on 2/22/17.
//  Copyright © 2017 Lonely Box. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 150
        case 1:
            let itemHeight = Constant.getItemWidth(boundWidth: tableView.bounds.size.width)
            
            let totalRow = ceil(Constant.totalItem / Constant.column)
            
            let totalTopBottomOffset = Constant.offset + Constant.offset
            
            let totalSpacing = CGFloat(totalRow - 1) * Constant.minLineSpacing
            
            let totalHeight  = ((itemHeight * CGFloat(totalRow)) + totalTopBottomOffset + totalSpacing)

            return totalHeight
        default:
            return UITableViewAutomaticDimension
        }
    }
}
