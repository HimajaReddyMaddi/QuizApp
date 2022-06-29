//
//  AppDelegate.swift
//  QuizApp
//
//  Created by Student on 4/20/22.
//

import UIKit
import SQLite3

var dbQueue: OpaquePointer!
var dbURL = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        dbQueue = create()
        if(createTables() == false){
            print("Error in creating tables")
        }
        else{
            print("table created")
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func create() -> OpaquePointer?{
        var db: OpaquePointer?
        let url = NSURL(fileURLWithPath: dbURL)
        if let pathComp = url.appendingPathComponent("TEST.sqlite"){
            let filePath = pathComp.path
            if sqlite3_open(filePath, &db) == SQLITE_OK{
                print("successfully opened database: at \(filePath)")
                return db
            }
            else{
                print("could not open database")
            }
        }
        else {
            print("file path is not available")
        }
        
        return db
    }
    
    func createTables() -> Bool{
        var bRetVal : Bool = false
        let createTable = sqlite3_exec(dbQueue, "CREATE TABLE JavaQ (JavaQ TEXT NULL)" , nil, nil, nil)
        let table1 = sqlite3_exec(dbQueue, "CREATE TABLE iOSQ (iOSQ TEXT NULL)" , nil, nil, nil)
        let table2 = sqlite3_exec(dbQueue, "CREATE TABLE HTMLQ ( HTMLQ TEXT NULL)" , nil, nil, nil)
        let table3 = sqlite3_exec(dbQueue, "CREATE TABLE CSSQ (CSSQ TEXT NULL)" , nil, nil, nil)
        let table4 = sqlite3_exec(dbQueue, "CREATE TABLE Answers (Answer1 TEXT NULL, Answer2 TEXT NULL, Answer3 TEXT NULL, Answer4 TEXT NULL)" , nil, nil, nil)
        let table5 = sqlite3_exec(dbQueue, "CREATE TABLE JavaQA (JavaQ TEXT NULL, Answer1 TEXT NULL, Answer2 TEXT NULL, Answer3 TEXT NULL, Answer4 TEXT NULL)" , nil, nil, nil)
        let table6 = sqlite3_exec(dbQueue, "CREATE TABLE iOSQA (iOSQ TEXT NULL, Answer1 TEXT NULL, Answer2 TEXT NULL, Answer3 TEXT NULL, Answer4 TEXT NULL)" , nil, nil, nil)
        
        let table7 = sqlite3_exec(dbQueue, "CREATE TABLE HTMLQA (HTMLQ TEXT NULL, Answer1 TEXT NULL, Answer2 TEXT NULL, Answer3 TEXT NULL, Answer4 TEXT NULL)" , nil, nil, nil)
        
        let table8 = sqlite3_exec(dbQueue, "CREATE TABLE CSSQA (CSSQ TEXT NULL, Answer1 TEXT NULL, Answer2 TEXT NULL, Answer3 TEXT NULL, Answer4 TEXT NULL)" , nil, nil, nil)
        let table9 = sqlite3_exec(dbQueue, "CREATE TABLE Topics (Topic TEXT NULL)" , nil, nil, nil)
        
        if(createTable != SQLITE_OK && table1 != SQLITE_OK && table2 != SQLITE_OK && table3 != SQLITE_OK && table4 != SQLITE_OK && table5 != SQLITE_OK && table6 != SQLITE_OK && table7 != SQLITE_OK && table8 != SQLITE_OK  && table9 != SQLITE_OK){
            print("Not able to create table")
            bRetVal = false
        }
        else{
            bRetVal = true
        }
        return bRetVal
    }



}

