//
//  DisplayTopicsVC.swift
//  QuizApp
//
//  Created by Student on 4/30/22.
//

import UIKit
import SQLite3

class DisplayTopicsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var topicsArray : [String] =  []
    //var topics1 = ["Java", "iOS", "HTML", "CSS"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setData()
        self.displayTopicTV.delegate = self
        self.displayTopicTV.dataSource = self
    }
    
    var topicSelected = ""

    @IBOutlet weak var displayTopicTV: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.topicsArray.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = topicsArray[indexPath.row]
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        topicSelected = topicsArray[indexPath.row]
        print("++\(topicSelected)")
        self.performSegue(withIdentifier: "displaySegue" , sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueName = segue.identifier
        if let segueDest = segue.destination as? DisplayQuestionsVC {
           
            segueDest.topic = topicSelected
            print("++\(topicSelected)")
            
        }
        

}
    let SQLITE_TRANS = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
    
    @IBOutlet weak var TopicLBL: UITextField!
    
    @IBAction func addTopic(_ sender: UIButton) {
        let insertStatement = "INSERT INTO Topics (Topic) values (?)"
        var insertQuery : OpaquePointer?
        
        if(sqlite3_prepare_v2(dbQueue, insertStatement, -1, &insertQuery, nil))  == SQLITE_OK {
            sqlite3_bind_text(insertQuery, 1, TopicLBL.text ?? "", -1, SQLITE_TRANS)
           
            if(sqlite3_step(insertQuery) ) == SQLITE_DONE{
                TopicLBL.text = ""
                
               // questionLBL.text = ""
                //text1.becomeFirstResponder()
                print("insert success")
            }
            else{
                print("error")
            }
            sqlite3_finalize(insertQuery)
    }
    }
    
    func setData(){
        
        let selectStatement = "SELECT Topic  FROM Topics "
        //let selectStatement1 = "SELECT Answer1 FROM Answers"
        var selectQuery : OpaquePointer?
       // var selectQuery1 : OpaquePointer?
        //  var showdata = ""
        if ((sqlite3_prepare_v2(dbQueue, selectStatement, -1, &selectQuery, nil) == SQLITE_OK))
            //&& (sqlite3_prepare_v2(dbQueue, selectStatement1, -1, &selectQuery1, nil) == SQLITE_OK))
        {
            while ((sqlite3_step(selectQuery) == SQLITE_ROW))
                   //&& (sqlite3_step(selectQuery1) == SQLITE_ROW) )
            {
                topicsArray.append((String(cString: sqlite3_column_text(selectQuery, 0))))
                
               
            }
            sqlite3_finalize(selectQuery)
        }
        
        for i in topicsArray{
            print(i)
        }
    }
    
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        let deleteStatement = "DELETE FROM Topics where Topic = '\(topicSelected)'"
        var deleteQuery : OpaquePointer?
        
        if(sqlite3_prepare_v2(dbQueue, deleteStatement, -1, &deleteQuery, nil))  == SQLITE_OK {
           // sqlite3_bind_text(deleteQuery, 1, questionLBL.text ?? "", -1, SQLITE_TRANS)
            //sqlite3_bind_text(insertQuery, 2, questionLBL.text ?? "", -1, SQLITE_TRANS)

            if(sqlite3_step(deleteQuery) ) == SQLITE_DONE{
               print("delete sucessful")
            }
            else{
                print("error")
            }
            sqlite3_finalize(deleteQuery)
            
        }
    }
    
}
