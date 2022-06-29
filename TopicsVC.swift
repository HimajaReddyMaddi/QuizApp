//
//  TopicsVC.swift
//  QuizApp
//
//  Created by Student on 4/26/22.
//

import UIKit

class TopicsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var java = ["Q1", "q2"]
    
    var topics = ["Java", "iOS", "HTML", "CSS"]

    var topicSelected = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.topicsTableView.dataSource = self
        self.topicsTableView.delegate = self
        
    }
    

    @IBOutlet weak var topicsTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = topics[indexPath.row]
        //curQuestion?.answer[indexPath.row].text
        //print("Himaja--- + \(cell.textLabel?.text)")
        //print("Himaja")
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        topicSelected = topics[indexPath.row]
        //print("topic + \(topic)")
        self.performSegue(withIdentifier: "topicsSegue" , sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueName = segue.identifier
        if let segueDest = segue.destination as? QuestionAnswerVC {
            segueDest.topic = topicSelected
        }
            
    }

}
