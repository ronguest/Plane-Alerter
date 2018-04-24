//
//  ViewController.swift
//  Plane Alerter
//
//  Created by Ron Guest on 4/23/18.
//  Copyright © 2018 Ron Guest. All rights reserved.
//

import Cocoa

//let tableData : NSMutableArray = [("1", "value1"), ("2", "value2")]
var tableData: [String] = ["ICAO1", "ICAO2"]

class ViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return tableData.count
    }
    
}

extension ViewController: NSTableViewDelegate {
    
    fileprivate enum CellIdentifiers {
        static let ICAOCell = "ICAOCell"
        //static let Data1Cell = "Data1Cell"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var text: String = ""
        var cellIdentifier: String = ""
        
        // 1
        guard let item = tableData[row] as? String else {
            return nil
        }
        
        // 2
        if tableColumn == tableView.tableColumns[0] {
            text = tableData[row]
            cellIdentifier = CellIdentifiers.ICAOCell
        }
        
        // 3
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: cellIdentifier), owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
            return cell
        }
        return nil
    }
    
}
