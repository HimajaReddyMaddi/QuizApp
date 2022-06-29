//
//  EditQuestionsVC.swift
//  QuizApp
//
//  Created by Student on 4/30/22.
//

import UIKit
import SQLite3

class EditQuestionsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.questionLBL.text = question
        // Do any additional setup after loading the view.
    }
    
  var qArray = [String]()
  var question = ""
    var data = ""
    
    
    let SQLITE_TRANS = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
    
    @IBOutlet weak var questionLBL: UITextField!
    
    @IBOutlet weak var answerLBL: UITextField!
    
    
    @IBOutlet weak var answer2: UITextField!
    
    
    @IBOutlet weak var answer3: UITextField!
    
    
    @IBOutlet weak var answer4: UITextField!
    
    
    
    @IBAction func updateLBL(_ sender: UIButton) {
        update()
    }
    
    
    
    @IBAction func submitButton(_ sender: UIButton) {
        print(data)
        if(data == "Java") {
           // let insertStatement = "INSERT INTO JavaQ (JavaQ) VALUES (?)"
            let insertStatement = "INSERT INTO JavaQA (JavaQ, Answer1, Answer2, Answer3, Answer4) values (?,?,?,?,?)"
            var insertQuery : OpaquePointer?
            
            if(sqlite3_prepare_v2(dbQueue, insertStatement, -1, &insertQuery, nil))  == SQLITE_OK {
                sqlite3_bind_text(insertQuery, 1, questionLBL.text ?? "", -1, SQLITE_TRANS)
                sqlite3_bind_text(insertQuery, 2, answerLBL.text ?? "", -1, SQLITE_TRANS)
                sqlite3_bind_text(insertQuery, 3, answer2.text ?? "", -1, SQLITE_TRANS)
                sqlite3_bind_text(insertQuery, 4, answer3.text ?? "", -1, SQLITE_TRANS)
                sqlite3_bind_text(insertQuery, 5, answer4.text ?? "", -1, SQLITE_TRANS)

                if(sqlite3_step(insertQuery) ) == SQLITE_DONE{
                    questionLBL.text = ""
                    answerLBL.text = ""
                    answer2.text = ""
                    answer3.text = ""
                    answer4.text = ""
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
        if (data == "iOS") {
        let insertStatement = "INSERT INTO iOSQA (iOSQ, Answer1, Answer2, Answer3, Answer4) values (?,?,?,?,?)"
        var insertQuery : OpaquePointer?
        
        if(sqlite3_prepare_v2(dbQueue, insertStatement, -1, &insertQuery, nil))  == SQLITE_OK {
            sqlite3_bind_text(insertQuery, 1, questionLBL.text ?? "", -1, SQLITE_TRANS)
            sqlite3_bind_text(insertQuery, 2, answerLBL.text ?? "", -1, SQLITE_TRANS)
            sqlite3_bind_text(insertQuery, 3, answer2.text ?? "", -1, SQLITE_TRANS)
            sqlite3_bind_text(insertQuery, 4, answer3.text ?? "", -1, SQLITE_TRANS)
            sqlite3_bind_text(insertQuery, 5, answer4.text ?? "", -1, SQLITE_TRANS)

            if(sqlite3_step(insertQuery) ) == SQLITE_DONE{
                questionLBL.text = ""
                answerLBL.text = ""
                answer2.text = ""
                answer3.text = ""
                answer4.text = ""
                print("insert success")
               // questionLBL.text = ""
                //text1.becomeFirstResponder()
            }
            else{
                print("error")
            }
            sqlite3_finalize(insertQuery)
            
        }
        }
        
        if (data == "HTML") {
        let insertStatement = "INSERT INTO HTMLQA (HTMLQ, Answer1, Answer2, Answer3, Answer4) values (?,?,?,?,?)"
        var insertQuery : OpaquePointer?
        
        if(sqlite3_prepare_v2(dbQueue, insertStatement, -1, &insertQuery, nil))  == SQLITE_OK {
            sqlite3_bind_text(insertQuery, 1, questionLBL.text ?? "", -1, SQLITE_TRANS)
            sqlite3_bind_text(insertQuery, 2, answerLBL.text ?? "", -1, SQLITE_TRANS)
            sqlite3_bind_text(insertQuery, 3, answer2.text ?? "", -1, SQLITE_TRANS)
            sqlite3_bind_text(insertQuery, 4, answer3.text ?? "", -1, SQLITE_TRANS)
            sqlite3_bind_text(insertQuery, 5, answer4.text ?? "", -1, SQLITE_TRANS)

            if(sqlite3_step(insertQuery) ) == SQLITE_DONE{
                questionLBL.text = ""
                answerLBL.text = ""
                answer2.text = ""
                answer3.text = ""
                answer4.text = ""
                print("insert success")
               // questionLBL.text = ""
                //text1.becomeFirstResponder()
            }
            else{
                print("error")
            }
            sqlite3_finalize(insertQuery)
            
        }
        }
        if (data == "CSS") {
        let insertStatement = "INSERT INTO CSSQA (CSSQ, Answer1, Answer2, Answer3, Answer4) values (?,?,?,?,?)"
        var insertQuery : OpaquePointer?
        
        if(sqlite3_prepare_v2(dbQueue, insertStatement, -1, &insertQuery, nil))  == SQLITE_OK {
            sqlite3_bind_text(insertQuery, 1, questionLBL.text ?? "", -1, SQLITE_TRANS)
            sqlite3_bind_text(insertQuery, 2, answerLBL.text ?? "", -1, SQLITE_TRANS)
            sqlite3_bind_text(insertQuery, 3, answer2.text ?? "", -1, SQLITE_TRANS)
            sqlite3_bind_text(insertQuery, 4, answer3.text ?? "", -1, SQLITE_TRANS)
            sqlite3_bind_text(insertQuery, 5, answer4.text ?? "", -1, SQLITE_TRANS)

            if(sqlite3_step(insertQuery) ) == SQLITE_DONE{
                questionLBL.text = ""
                answerLBL.text = ""
                answer2.text = ""
                answer3.text = ""
                answer4.text = ""
                print("insert success")
               // questionLBL.text = ""
                //text1.becomeFirstResponder()
            }
            else{
                print("error")
            }
            sqlite3_finalize(insertQuery)
            
        }
        }
        //select query
        
//        let selectStatement = "SELECT QUESTION1 FROM QUESTION "
//        var selectQuery : OpaquePointer?
//        //  var showdata = ""
//        if sqlite3_prepare_v2(dbQueue, selectStatement, -1, &selectQuery, nil) == SQLITE_OK{
//            while sqlite3_step(selectQuery) == SQLITE_ROW {
//
//                qArray.append(String(cString: sqlite3_column_text(selectQuery, 0)))
//                //String(cString: sqlite3_column_text(selectQuery, 0)) //"\t\t" + String(cString: sqlite3_column_text(selectQuery, 1)) + "\n"
//            }
//            sqlite3_finalize(selectQuery)
//        }
//
//        let insertStatement = "INSERT INTO Answers (Answer1,Answer2, Answer3, Answer4) VALUES (?, ?, ?, ?)"
//        var insertQuery : OpaquePointer?
//
//        if(sqlite3_prepare_v2(dbQueue, insertStatement, -1, &insertQuery, nil))  == SQLITE_OK {
//            sqlite3_bind_text(insertQuery, 1, answerLBL.text ?? "", -1, SQLITE_TRANS)
//           // sqlite3_bind_text(insertQuery, 2, questionLBL.text ?? "", -1, SQLITE_TRANS)
//
//            if(sqlite3_step(insertQuery) ) == SQLITE_DONE{
//                answerLBL.text = ""
//               // questionLBL.text = ""
//                //text1.becomeFirstResponder()
//                print("insert answer success")
//            }
//            else{
//                print("error")
//            }
//            sqlite3_finalize(insertQuery)
//            
//        }
      
        
    }
    
    func update(){
        if(data == "Java") {
        let updateStatement = "UPDATE JavaQA SET  JavaQ = '\(questionLBL.text!)' where JavaQ = '\(question)'"
        let update = "UPDATE JavaQA SET  JavaQ = '\(questionLBL.text!)', Answer1 = '\(answerLBL.text!)', Answer2 = '\(answer2.text!)', Answer3 = '\(answer3.text!)', Answer4 = '\(answer4.text!)' where JavaQ = '\(question)'"
        print(updateStatement)
        var updateQuery: OpaquePointer?
          if sqlite3_prepare_v2(dbQueue, update, -1, &updateQuery, nil) ==
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

    //Answer1 = '\(answerLBL.text!)', Answer2 = '\(answer2.text!)', Answer3 = '\(answer3.text!)', Answer4 = '\(answer4.text!)'
        if(data == "iOS") {
        let updateStatement = "UPDATE iOSQA SET  iOSQ = '\(questionLBL.text!)' where iOSQ = '\(question)'"
        let update = "UPDATE JavaQA SET  iOSQ = '\(questionLBL.text!)', Answer1 = '\(answerLBL.text!)', Answer2 = '\(answer2.text!)', Answer3 = '\(answer3.text!)', Answer4 = '\(answer4.text!)' where iOSQ = '\(question)'"
        print(updateStatement)
        var updateQuery: OpaquePointer?
          if sqlite3_prepare_v2(dbQueue, update, -1, &updateQuery, nil) ==
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
        if(data == "HTML") {
        //let updateStatement = "UPDATE JavaQA SET  JavaQ = '\(questionLBL.text!)' where JavaQ = '\(question)'"
        let update = "UPDATE HTMLQA SET  HTMLQ = '\(questionLBL.text!)', Answer1 = '\(answerLBL.text!)', Answer2 = '\(answer2.text!)', Answer3 = '\(answer3.text!)', Answer4 = '\(answer4.text!)' where HTMLQ = '\(question)'"
        print(update)
        var updateQuery: OpaquePointer?
          if sqlite3_prepare_v2(dbQueue, update, -1, &updateQuery, nil) ==
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
        if(data == "CSS") {
        let updateStatement = "UPDATE CSSQA SET  CSSQ = '\(questionLBL.text!)' where CSSQ = '\(question)'"
        let update = "UPDATE CSSQA SET  CSSQ = '\(questionLBL.text!)', Answer1 = '\(answerLBL.text!)', Answer2 = '\(answer2.text!)', Answer3 = '\(answer3.text!)', Answer4 = '\(answer4.text!)' where CSSQ = '\(question)'"
        print(update)
        var updateQuery: OpaquePointer?
          if sqlite3_prepare_v2(dbQueue, update, -1, &updateQuery, nil) ==
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
    
    }

    
    

