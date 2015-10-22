import UIKit

class JSONParser {
    static func jsonFromData(data: NSData) throws -> ([AnyObject],Dictionary<String, AnyObject>) {
        var dict = Dictionary<String, AnyObject>()
        var arr = [AnyObject]()
        do {
            let nsObj: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves)
            if isDict(nsObj!) {
                dict = JSONParser.parseDict(nsObj as! NSDictionary)
            } else if isArr(nsObj!) {
                arr = JSONParser.parseArray(nsObj as! NSArray)
            }
        } catch let error as NSError {
            throw error
        }
        return (arr,dict)
    }
    
    
    static func parseArray(nsArr: NSArray) -> Array<AnyObject> {
        var arr = [AnyObject]()
        for obj in nsArr {
            if isDict(obj) {
                arr.append(JSONParser.parseDict(obj as! NSDictionary))
            } else if isArr(obj) {
                arr.append(JSONParser.parseArray(obj as! NSArray))
            } else {
                arr.append(obj)
            }
        }
        
        return arr
    }
    
    static func parseDict(nsDict: NSDictionary) -> Dictionary<String,AnyObject>{
        var dict = Dictionary<String, AnyObject>()
        for (key,value) in nsDict {
            if isDict(value) {
                dict[key as! String] = parseDict(value as! NSDictionary)
            } else if isArr(value) {
                dict[key as! String] = parseArray(value as! NSArray)
            } else {
                dict[key as! String] = value
            }
        }
        return dict
    }
    
    
}
