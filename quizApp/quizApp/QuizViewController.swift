//
//  QuizViewController.swift
//  quizApp
//
//  Created by Hina Nakahira on 2022/10/17.
//

import UIKit

class QuizViewController: UIViewController {
    
    var csvArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        csvArray = loadCSV(fileName: "quiz")
        print(csvArray)
    }
    
    @IBAction func btnAction(sender: UIButton) {
        print(sender.tag)
    }

    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
            
        } catch {
            print("Error")
        }
        return csvArray

    }
}
