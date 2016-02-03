
func getPassword() -> (username: String, password: String) {
    var tuple = (username: "", password: "")

    SecRequestSharedWebCredential(.None, .None) { (credentials, error) -> Void in
        guard error == nil else {
            NSLog("error loading safari credentials: \(error)")
            return
        }

        guard let unwrappedCredentials = credentials else {
            print("Error unwrapping credentials array", credentials)
            return
        }
        let arrayCredentials = unwrappedCredentials as [AnyObject]
        guard let typedCredentials = arrayCredentials as? [[String: AnyObject]] else {
            print("error typecasting credentials")
            return
        }

        let credential = typedCredentials[0]
        if let username = credential[kSecAttrAccount as String], password = credential[kSecSharedPassword as String] {
            tuple.username = username
            tuple.password = password
        }
    }
    return tuple
    
}
