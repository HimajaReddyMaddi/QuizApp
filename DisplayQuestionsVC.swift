//
//  DisplayQuestionsVC.swift
//  QuizApp
//
//  Created by Student on 4/30/22.
//

import UIKit
import SQLite3

class DisplayQuestionsVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
   
    var questionSelected = ""
    
   // var questionsArray = [""]
    var javaQuestionsArray: [String] = []
    //var emptyDoubles: [Double] = []
    var iOSQuestionsArray: [String] = []
    var htmlQuestionsArray: [String] = []
    var cssQuestionsArray: [String] = []

    var topic = ""
    //override;
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setQuestions()
        self.questionsTV.dataSource = self
        self.questionsTV.delegate = self
    }
    
    
    
//    @IBAction func add(_ sender: UIBarButtonItem) {
//        self.performSegue(withIdentifier: "addSegue", sender: <#T##Any?#>)
//        
//    }
    
    @IBOutlet weak var questionsTV: UITableView!
    

   
    @IBAction func deleteBtn(_ sender: UIButton) {
       delete()
        
    }
    
    
//    @IBAction func updateBtn(_ sender: UIButton) {
//        //update()
//        performSegue(withIdentifier: "addSegue", sender: <#T##Any?#>)
//    }
    
    
    
    func setQuestions(){
        print(topic)
        if(topic == "Java"){
        let selectStatement = "SELECT JavaQ FROM JavaQA "
        var selectQuery : OpaquePointer?
        //  var showdata = ""
        if sqlite3_prepare_v2(dbQueue, selectStatement, -1, &selectQuery, nil) == SQLITE_OK{
            while sqlite3_step(selectQuery) == SQLITE_ROW {
                
                javaQuestionsArray.append(String(cString: sqlite3_column_text(selectQuery, 0)))
                //String(cString: sqlite3_column_text(selectQuery, 0)) //"\t\t" + String(cString: sqlite3_column_text(selectQuery, 1)) + "\n"
            }
            sqlite3_finalize(selectQuery)
        }
        for i in javaQuestionsArray{
            print(i)

        }
        }
        if(topic == "CSS"){
        let selectStatement = "SELECT CSSQ FROM CSSQA "
        var selectQuery : OpaquePointer?
        //  var showdata = ""
        if sqlite3_prepare_v2(dbQueue, selectStatement, -1, &selectQuery, nil) == SQLITE_OK{
            while sqlite3_step(selectQuery) == SQLITE_ROW {
                
                cssQuestionsArray.append(String(cString: sqlite3_column_text(selectQuery, 0)))
                //String(cString: sqlite3_column_text(selectQuery, 0)) //"\t\t" + String(cString: sqlite3_column_text(selectQuery, 1)) + "\n"
            }
            sqlite3_finalize(selectQuery)
        }
        for i in cssQuestionsArray{
            print(i)

        }
        }
        if(topic == "iOS"){
        let selectStatement = "SELECT iOSQ FROM iOSQA "
        var selectQuery : OpaquePointer?
        //  var showdata = ""
        if sqlite3_prepare_v2(dbQueue, selectStatement, -1, &selectQuery, nil) == SQLITE_OK{
            while sqlite3_step(selectQuery) == SQLITE_ROW {
                
                iOSQuestionsArray.append(String(cString: sqlite3_column_text(selectQuery, 0)))
                //String(cString: sqlite3_column_text(selectQuery, 0)) //"\t\t" + String(cString: sqlite3_column_text(selectQuery, 1)) + "\n"
            }
            sqlite3_finalize(selectQuery)
        }
        for i in iOSQuestionsArray{
            print(i)

        }
        }
        if(topic == "HTML"){
        let selectStatement = "SELECT HTMLQ FROM HTMLQA "
        var selectQuery : OpaquePointer?
        //  var showdata = ""
        if sqlite3_prepare_v2(dbQueue, selectStatement, -1, &selectQuery, nil) == SQLITE_OK{
            while sqlite3_step(selectQuery) == SQLITE_ROW {
                
                htmlQuestionsArray.append(String(cString: sqlite3_column_text(selectQuery, 0)))
                //String(cString: sqlite3_column_text(selectQuery, 0)) //"\t\t" + String(cString: sqlite3_column_text(selectQuery, 1)) + "\n"
            }
            sqlite3_finalize(selectQuery)
        }
        for i in htmlQuestionsArray{
            print(i)

        }
        }
            }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if(topic == "Java"){
            count = javaQuestionsArray.count
        }

        else if(topic == "iOS"){
            count = iOSQuestionsArray.count
        }
        else if(topic == "HTML"){
            count = htmlQuestionsArray.count
        }
        else if(topic == "CSS"){
            count = cssQuestionsArray.count
        }
           return count
            
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       // cell.textLabel?.text = "Himaja"
        if(topic == "Java"){
        cell.textLabel?.text = javaQuestionsArray[indexPath.row]
        }
        if(topic == "iOS"){
            cell.textLabel?.text = iOSQuestionsArray[indexPath.row]
        }
        if(topic == "HTML"){
        cell.textLabel?.text = htmlQuestionsArray[indexPath.row]
        }
        if(topic == "CSS"){
            cell.textLabel?.text = cssQuestionsArray[indexPath.row]
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(topic == "Java") {
            questionSelected = javaQuestionsArray[indexPath.row]
        }
        if(topic == "iOS"){
            questionSelected = iOSQuestionsArray[indexPath.row]
        }
        if(topic == "HTML") {
            questionSelected = htmlQuestionsArray[indexPath.row]
        }
        if(topic == "CSS"){
            questionSelected = cssQuestionsArray[indexPath.row]
        }
        //questionSelected = javaQuestionsArray[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueName = segue.identifier
        if let segueDest = segue.destination as? EditQuestionsVC {
            segueDest.question = questionSelected
            segueDest.data = topic
        }
    }

  func delete()
{
    if(topic == "Java") {
    let deleteStatement = "DELETE FROM JavaQA where JavaQ = '\(questionSelected)'"
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
    if(topic == "iOS") {
    let deleteStatement = "DELETE FROM iOSQA where iOSQ = '\(questionSelected)'"
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
    if(topic == "HTML") {
    let deleteStatement = "DELETE FROM HTMLQA where HTMLQ = '\(questionSelected)'"
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
    if(topic == "CSS") {
    let deleteStatement = "DELETE FROM CSSQA where CSSQ = '\(questionSelected)'"
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
    
    func update(){
        let updateStatement = "UPDATE JavaQ SET  JavaQ = 'xyz' where JavaQ = '\(questionSelected)' "
        var updateQuery: OpaquePointer?
          if sqlite3_prepare_v2(dbQueue, updateStatement, -1, &updateQuery, nil) ==
              SQLITE_OK {
            if sqlite3_step(updateQuery) == SQLITE_DONE {
              print("\nSuccessfully updated row.")
            } else {
              print("\nCould not update row.")
            }
          } else {
            print("\nUPDATE statement is not prepared")
          }
          sqlite3_finalize(updateQuery)
        }
    
}
