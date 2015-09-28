class InitWithCoder {
  var myString: String
  
  init(coder aDecoder: NSCoder) {
    if let s = aDecoder.valueForKey("myKey") as? String {
      myString = s
    } else {
      myString = ""
    }
  }
  
  func encodeWithCoder(coder anEncoder: NSCoder) {
    anEncoder.setValue(myString, forKey: "myKey")
  }

}
