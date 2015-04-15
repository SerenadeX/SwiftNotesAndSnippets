# SwiftNotesAndSnippets


#### Closures as function Parameters

If I want to do a Swift closure in a function declaration:

```swift
func theFunction(aParam: String, aCallback: ((String, Int) -> Void)) {
  aCallback("Some String", 147)
}
```
