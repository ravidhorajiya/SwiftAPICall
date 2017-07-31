//
//  WebServices.swift
//  GlobalAPICall
//
//  Created by Ravi on 06/07/17.
//  Copyright © 2017 Ravi. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration
import SVProgressHUD

var dictResponse: ( _ dictResponse:[String: Any] ) -> Void = {_ in }

class WebServices: NSObject
{
    func CallGlobalAPI( urlString:String, JsonDict:NSDictionary, HttpMethod:String, ProgressView:Bool, responseDict:@escaping ( _ dictResponse:[String: Any] ) -> Void )  {
        
        if (HttpMethod == "POST")
        {
            if ProgressView == true {
                self.ProgressViewShow()
            }
            if Reachability.isConnectedToNetwork() == true {
                print("Internet connection OK")
                // prepare json data
                let jsonData = try? JSONSerialization.data(withJSONObject: JsonDict)
                
                // create post request
                let url = URL(string: urlString)!
                var request = URLRequest(url: url)
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("application/json", forHTTPHeaderField: "Accept")
                request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
                request.httpMethod = HttpMethod
                
                // insert json data to the request
                request.httpBody = jsonData
                
                _ = URLSession.shared.dataTask(with: request) { data, response, error in guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    self.ProgressViewHide()
                    return
                    }
                    let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                    if let responseJSON = responseJSON as? [String: Any]
                    {
                        print("====================== URL =====================")
                        print(urlString)
                        print("================== PERAMETERS ==================")
                        print(JsonDict)
                        print("=================== RESPONSE ===================")
                        print(responseJSON)
                        DispatchQueue.main.async
                            {
                                responseDict(responseJSON)
                        }
                    }
                    self.ProgressViewHide()
                    }.resume()
            } else {
                self.ProgressViewHide()
                let alert = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                UIApplication.shared.windows[0].rootViewController?.present(alert, animated: true, completion: nil)
                print("Internet connection FAILED")
            }
        }
        else
        {
            if ProgressView == true {
                self.ProgressViewShow()
            }
            if Reachability.isConnectedToNetwork() == true {
                print("Internet connection OK")
                // create get request
                let url = URL(string: urlString)!
                var request = URLRequest(url: url)
                request.httpMethod = HttpMethod
                
                _ = URLSession.shared.dataTask(with: request) { data, response, error in guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    self.ProgressViewHide()
                    return
                    }
                    let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                    if let responseJSON = responseJSON as? [String: Any]
                    {
                        print("====================== URL =====================")
                        print(urlString)
                        print("================== PERAMETERS ==================")
                        print(JsonDict)
                        print("=================== RESPONSE ===================")
                        print(responseJSON)
                        DispatchQueue.main.async
                            {
                                responseDict(responseJSON)
                        }
                    }
                    self.ProgressViewHide()
                    }.resume()
            } else {
                self.ProgressViewHide()
                let alert = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                UIApplication.shared.windows[0].rootViewController?.present(alert, animated: true, completion: nil)
                print("Internet connection FAILED")
            }
        }
    }
    
    // MARK: ProgressView
    func ProgressViewShow() {
        SVProgressHUD.show(withStatus: "Please wait..")
    }
    
    func ProgressViewHide() {
        SVProgressHUD.dismiss()
    }
}
