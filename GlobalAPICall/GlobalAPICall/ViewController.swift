//
//  ViewController.swift
//  GlobalAPICall
//
//  Created by Ravi on 06/07/17.
//  Copyright © 2017 Ravi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblResponse: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPost(_ sender: Any) {
        let strURL = "" //Add URL
        let JSONDic:[String: Any] = [
            "key1":"value1",
            "key2":"value2",
            "key3":"value3"
        ] //Add Perameter of Dictionary
        
        WebServices().CallGlobalAPI(urlString: strURL, JsonDict: JSONDic as NSDictionary, HttpMethod: "POST") { ( _ dictResponse:[String: Any] ) in
//                print(dictResponse)
            DispatchQueue.main.async {
                self.lblResponse.text = dictResponse.description
            }
        }
    }

    @IBAction func btnGet(_ sender: Any) {
        let strURL = "" //Add URL
        let JSONDic:[String: Any] = [:] //Add NIL Perameter of Dictionary
        WebServices().CallGlobalAPI(urlString: strURL, JsonDict: JSONDic as NSDictionary, HttpMethod: "GET") { ( _ dictResponse:[String: Any] ) in
//                print(dictResponse)
            DispatchQueue.main.async {
                self.lblResponse.text = dictResponse.description
            }
        }
    }
}

