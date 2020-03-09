//
//  NewsTableViewControllerTest.swift
//  NewsListDemoTests
//
//  Created by Abhishek Gupta on 09/03/20.
//  Copyright © 2020 Abhishek Gupta. All rights reserved.
//

import XCTest
@testable import NewsListDemo

class NewsTableViewControllerTest: XCTestCase {

    var newsViewController: NewsTableViewController!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let stoaryBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc: NewsTableViewController = stoaryBoard.instantiateViewController(withIdentifier: "NewsTableViewController") as! NewsTableViewController
        newsViewController = vc
        
        _ = newsViewController.tableView
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        newsViewController = nil
    }
    
    func testInitialization() {
        XCTAssertNotNil(newsViewController)
    }
    
    func testTableView() {
        XCTAssertNotNil(newsViewController.testable_tableView)
        XCTAssertEqual(newsViewController.testable_tableView.numberOfSections, 0)
        XCTAssertNotEqual(newsViewController.testable_tableView.numberOfSections, 2)
    }

}
