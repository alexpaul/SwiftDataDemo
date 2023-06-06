# SwiftDataDemo

WWDC23 introduces a new persistence API called SwiftData. 

## Glossary 

* `.modelContainer(for: Item.self)`: sets the model container in the scene 
* `SwiftData`: enables you to add persistence to your app quickly, with minimal code and no external dependencies
* `@Model`: converts a Swift class into a stored model that’s managed by SwiftData
* `@Query private var items: [Item]`: a property wrapper that fetches a set of models and keeps those models in sync with the underlying data
* `@Environment(\.modelContext) private var modelContext`: the `SwiftData` model context

![Screenshot 2023-06-05 at 8 55 57 PM](https://github.com/alexpaul/SwiftDataDemo/assets/1819208/1e39447c-d55b-46f1-8c8c-7ffd07271d3f)

## Resources

* [Apple docs: `SwiftData`](https://developer.apple.com/documentation/swiftdata)
