//
//  QuestionAnswerVC.swift
//  QuizApp
//
//  Created by Student on 4/26/22.
//

import UIKit
import SQLite3

class QuestionAnswerVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var questions = [Question]()
    
    var curQuestion : Question?
    
    var countYes = 0
    var countNo = 0
    
    var topic = ""
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var answerTableView: UITableView!
    
    @IBOutlet weak var table: UITableViewCell!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       // setQuestion()
        setQuestionsDB()
        display(question: questions.first!)
        self.answerTableView.delegate = self
        self.answerTableView.dataSource = self
        self.submitBtn.isEnabled = false
        
    }
    
   
    private func display(question : Question){
        questionLabel.text = question.text
        curQuestion = question
    }
    
    private func checkAnswer(answer: Answer , question: Question ) -> Bool {
        return question.answer.contains(where: {$0.text == answer.text}) && answer.correct
        
    }
    
    
    private func setQuestion(){
        print("topic brought \(topic)")
        if topic == "Java"{
        questions.append(Question(text: "What is full form of OOPS", answer: [Answer(text: "Object Oriented Structure", correct: false), Answer(text: "Object Oriented Programming", correct: false), Answer(text: "Object Oriented Programming System", correct: true),Answer(text: "Object Oriented Programming Structure", correct: false)]))
        
        questions.append(Question(text: "What is full form JVM", answer: [Answer(text: "Java Dev tool", correct: false), Answer(text: "Java Virtual Machine", correct: true), Answer(text: "Used to compile Java programs", correct: false),Answer(text: "Java Machine", correct: false)]))
        
        questions.append(Question(text: "Which of the following is correct Integer Declaration in Java?", answer: [Answer(text: "int x = 5;", correct: true), Answer(text: "'int x = 5.0;'", correct: false), Answer(text: "x=10;", correct: false),Answer(text: "Int x = 5;", correct: false)]))
            
            questions.append(Question(text: "Which of the following is not an OOPS concept in Java?", answer: [Answer(text: "Inheritance", correct: false), Answer(text: "Polymorphism", correct: false), Answer(text: "Compilation", correct: true),Answer(text: "Encapsulation", correct: false)]))
            questions.append(Question(text: "What is the extension of compiled java classes?", answer: [Answer(text: ".txt", correct: false), Answer(text: ".js", correct: false), Answer(text: ".class", correct: false),Answer(text: ".java", correct: true)]))
        }
        if topic == "iOS"{
        questions.append(Question(text: "To Create Mutable Object __ is Used?", answer: [Answer(text: "Var", correct: true), Answer(text: "Let", correct: false), Answer(text: "Both Var & Let", correct: false),Answer(text: "None of the above", correct: false)]))
        
        questions.append(Question(text: "The IDE Used In Swift Is ........?", answer: [Answer(text: "Ld", correct: false), Answer(text: "Gas", correct: false), Answer(text: "Xcode", correct: true),Answer(text: "Swiftc", correct: false)]))
        
        questions.append(Question(text: "Swift is which kind of language?", answer: [Answer(text: "Type safe language", correct: false), Answer(text: "Scripting language", correct: false), Answer(text: "Object oriented programming language", correct: false),Answer(text: "All of the above", correct: true)]))
            questions.append(Question(text: "We use the keyword ............ to create contants in swift?", answer: [Answer(text: "let", correct: true), Answer(text: "conts", correct: false), Answer(text: "contants", correct: false),Answer(text: "None of the above", correct: false)]))
            questions.append(Question(text: "What are the advantages of Swift?", answer: [Answer(text: "Swift is safe", correct: false), Answer(text: "Swift is fast", correct: false), Answer(text: "Swift is open source", correct: false),Answer(text: "All of the above", correct: true)]))
        }
        if topic == "HTML"{
        questions.append(Question(text: "HTML is what type of language ?", answer: [Answer(text: "Scripting Language", correct: false), Answer(text: "Markup Language", correct: true), Answer(text: "Programming Language", correct: false),Answer(text: "Network Protocol", correct: false)]))
        
        questions.append(Question(text: "HTML uses", answer: [Answer(text: "User defined tags", correct: false), Answer(text: "Pre-specified tags", correct: false), Answer(text: "Fixed tags defined by the language", correct: true),Answer(text: "Tags only for linking", correct: false)]))
        
        questions.append(Question(text: "What is the full form of HTML?", answer: [Answer(text: "HyperText Markup Language", correct: true), Answer(text: "Hyper Teach Markup Language", correct: false), Answer(text: "Hyper Tech Markup Language", correct: false),Answer(text: "None of these", correct: false)]))
            questions.append(Question(text: "What should be the first tag in any HTML document?", answer: [Answer(text: "<head>", correct: false), Answer(text: "<title>", correct: false), Answer(text: "<html>", correct: true),Answer(text: "<document>", correct: false)]))
            questions.append(Question(text: "Which HTML tag produces the biggest heading?", answer: [Answer(text: "<h7>", correct: false), Answer(text: "<h9>", correct: false), Answer(text: "<h1>", correct: true),Answer(text: "<h4>", correct: false)]))
        }
        if topic == "CSS"{
        questions.append(Question(text: " CSS stands for -", answer: [Answer(text: "Cascade style sheets", correct: false), Answer(text: "Color and style sheets", correct: false), Answer(text: "Cascading style sheets", correct: true),Answer(text: "None of the above", correct: false)]))
        
        questions.append(Question(text: "The property in CSS used to change the background color of an element is -", answer: [Answer(text: "bgcolor", correct: false), Answer(text: "color", correct: false), Answer(text: "background-color", correct: true),Answer(text: "All of the above", correct: false)]))
        
        questions.append(Question(text: "The CSS property used to control the element's font-size is?", answer: [Answer(text: "text-style", correct: false), Answer(text: "text-size", correct: false), Answer(text: "font-size", correct: true),Answer(text: "None of the above", correct: false)]))
            questions.append(Question(text: "Which of the following CSS property is used to set the background image of an element?", answer: [Answer(text: "background-attachment", correct: false), Answer(text: "background-image", correct: true), Answer(text: "background-color", correct: false),Answer(text: "All of the above", correct: false)]))
            questions.append(Question(text: "Which of the following is the correct syntax to make the background-color of all paragraph elements to yellow?", answer: [Answer(text: "p {background-color : yellow;}", correct: true), Answer(text: "p {background-color : #yellow;}", correct: false), Answer(text: "all {background-color : yellow;}", correct: false),Answer(text: "all p {background-color : #yellow;}", correct: false)]))
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curQuestion?.answer.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath)
        cell.textLabel?.text = curQuestion?.answer[indexPath.row].text
        //print(cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at:indexPath, animated: true)
        guard let  question = curQuestion else {
            return
        }
       
        let answer = question.answer[indexPath.row]
        if checkAnswer(answer: answer, question: question){
            countYes = countYes + 1
           // print("yes+ \(countYes)")
           // print("Himaja")
        }
        else{
            countNo = countNo + 1
           // print("No+ \(countNo)")
        }
        
       if let index = questions.firstIndex(where: { $0.text == question.text })
        {
           
            if(index == questions.count - 1){
                self.nextBtn.isEnabled = false
                self.submitBtn.isEnabled = true
            }
        }
    }
    


    @IBAction func submit(_ sender: UIButton) {
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueName = segue.identifier
        if let segueDest = segue.destination as? ScoreVC{
            
            segueDest.scoreText = "Total Score: \(countYes)"
            //segueDest.scoreText = "Total Score: \(questions.count  - countNo)"
            
        }
    }
    
    
    @IBAction func previous(_ sender: UIButton) {
        
        guard let question = curQuestion else {
            return
        }
       
        
        if let index = questions.firstIndex(where: { $0.text == question.text })
        {
           // index  = index +1
            //print("index is \(index)")
            if index <= (questions.count - 1) && index != 0{
            
                let prevQuestion = questions[index-1]

                display(question: prevQuestion)
                answerTableView.reloadData()
                
            }
        }

    }
    
    
    
    
    @IBAction func Next(_ sender: UIButton) {
        guard let question = curQuestion else {
            return
        }
        
        if let index = questions.firstIndex(where: { $0.text == question.text })
        {
            if index < (questions.count - 1) {
                let nextQuestion = questions[index+1]
                display(question: nextQuestion)
                answerTableView.reloadData()
                
                
            }

        }
        
    }
    
    func setQuestionsDB(){
        if(topic == "Java" ){
            var answers : [String] = []
            let selectStatement = "SELECT JavaQ, Answer1, Answer2, Answer3, Answer4 FROM JavaQA "
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
                    
                    questions.append(Question(text: (String(cString: sqlite3_column_text(selectQuery, 0))), answer: [Answer(text: (String(cString: sqlite3_column_text(selectQuery, 1))), correct: true), Answer(text: (String(cString: sqlite3_column_text(selectQuery, 2))), correct: false), Answer(text: (String(cString: sqlite3_column_text(selectQuery, 3))), correct: false),Answer(text: (String(cString: sqlite3_column_text(selectQuery, 4))), correct: false)]))
                        //java.append(String(cString: sqlite3_column_text(selectQuery, 0)))
                    //String(cString: sqlite3_column_text(selectQuery, 0)) //"\t\t" + String(cString: sqlite3_column_text(selectQuery, 1)) + "\n"
                    answers.append((String(cString: sqlite3_column_text(selectQuery, 0))))
                }
                sqlite3_finalize(selectQuery)
            }
            for i in answers{
                print(i)
            }
        }
        if(topic == "iOS" ){
            var answers : [String] = []
            let selectStatement = "SELECT iOSQ, Answer1, Answer2, Answer3, Answer4 FROM iOSQA "
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
                    
                    questions.append(Question(text: (String(cString: sqlite3_column_text(selectQuery, 0))), answer: [Answer(text: (String(cString: sqlite3_column_text(selectQuery, 1))), correct: false), Answer(text: (String(cString: sqlite3_column_text(selectQuery, 2))), correct: true), Answer(text: (String(cString: sqlite3_column_text(selectQuery, 3))), correct: false),Answer(text: (String(cString: sqlite3_column_text(selectQuery, 4))), correct: false)]))

                    answers.append((String(cString: sqlite3_column_text(selectQuery, 0))))
                }
                sqlite3_finalize(selectQuery)
            }
           
    }
        if(topic == "HTML" ){
            var answers : [String] = []
            let selectStatement = "SELECT HTMLQ, Answer1, Answer2, Answer3, Answer4 FROM HTMLQA "
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
                    
                    questions.append(Question(text: (String(cString: sqlite3_column_text(selectQuery, 0))), answer: [Answer(text: (String(cString: sqlite3_column_text(selectQuery, 1))), correct: false), Answer(text: (String(cString: sqlite3_column_text(selectQuery, 2))), correct: false), Answer(text: (String(cString: sqlite3_column_text(selectQuery, 3))), correct: true),Answer(text: (String(cString: sqlite3_column_text(selectQuery, 4))), correct: false)]))

                    answers.append((String(cString: sqlite3_column_text(selectQuery, 0))))
                }
                sqlite3_finalize(selectQuery)
            }
           
    }
        if(topic == "CSS" ){
            var answers : [String] = []
            let selectStatement = "SELECT CSSQ, Answer1, Answer2, Answer3, Answer4 FROM CSSQA "
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
                    
                    questions.append(Question(text: (String(cString: sqlite3_column_text(selectQuery, 0))), answer: [Answer(text: (String(cString: sqlite3_column_text(selectQuery, 1))), correct: false), Answer(text: (String(cString: sqlite3_column_text(selectQuery, 2))), correct: false), Answer(text: (String(cString: sqlite3_column_text(selectQuery, 3))), correct: false),Answer(text: (String(cString: sqlite3_column_text(selectQuery, 4))), correct: true)]))

                    answers.append((String(cString: sqlite3_column_text(selectQuery, 0))))
                }
                sqlite3_finalize(selectQuery)
            }
           
    }
    
}
}
