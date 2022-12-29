# zipfo
iOS Zip Code Information Lookup Application

Created this application to continue to get used to the Swift Async/Await Concurrency Pattern
Also took the opportuity to delve into MapKit, and writing better service & view model code.

#Interesting Things Learned
- Easy to render different views in SwiftUI when using an Enum to hold the current state of a ViewModel
- To Render a different view of a Map(), we can edit the Binding $mapRegion during .onAppear
- Creating a protocol for Service, and ViewModel are a cleaner way than default classes
- Learned about the CodingKey protocol JSON data when the expected name can't be processed as a variable name (Check ZipInformation Model)
