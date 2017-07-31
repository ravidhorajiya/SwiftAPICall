# SwiftAPICall

Just Call below function.

# POST METHOD
```
        let strURL = "" //Add URL
        let JSONDic:[String: Any] = [
            "key1":"value1",
            "key2":"value2",
            "key3":"value3"
        ] //Add Perameter of Dictionary
        
        WebServices().CallGlobalAPI(urlString: strURL, JsonDict: JSONDic as NSDictionary, HttpMethod: "POST", ProgressView: true) { ( _ dictResponse:[String: Any] ) in
//                print(dictResponse)
            DispatchQueue.main.async {
                self.lblResponse.text = dictResponse.description
            }
        }
```

# GET METHOD
```
        let strURL = "" //Add URL
        let JSONDic:[String: Any] = [:] //Add NIL Perameter of Dictionary
        WebServices().CallGlobalAPI(urlString: strURL, JsonDict: JSONDic as NSDictionary, HttpMethod: "GET", ProgressView: true) { ( _ dictResponse:[String: Any] ) in
//                print(dictResponse)
            DispatchQueue.main.async {
                self.lblResponse.text = dictResponse.description
            }
        }
```
