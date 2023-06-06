# SwiftDataDemo

WWDC23 introduces a new persistence API called SwiftData. 

> Note: All the code in this project and below was generated after selecting "SwiftData" as a Storage option. 

## Glossary 

* `.modelContainer(for: Item.self)`: sets the model container in the scene 
* `SwiftData`: enables you to add persistence to your app quickly, with minimal code and no external dependencies
* `@Model`: converts a Swift class into a stored model that’s managed by SwiftData
* `@Query private var items: [Item]`: a property wrapper that fetches a set of models and keeps those models in sync with the underlying data
* `@Environment(\.modelContext) private var modelContext`: the `SwiftData` model context

![Screenshot 2023-06-05 at 8 55 57 PM](https://github.com/alexpaul/SwiftDataDemo/assets/1819208/1e39447c-d55b-46f1-8c8c-7ffd07271d3f)

## Getting stated with `SwiftData`

* Create a new Xcode project using Xcode 15 Beta   
* Select "SwiftData" as Storage   
![select-swiftdata](https://github.com/alexpaul/SwiftDataDemo/assets/1819208/ccfe80de-1fac-40c2-bafe-ea13f636c73f)
* Select to host in "CloudKit"  
![host-in-cloudkit](https://github.com/alexpaul/SwiftDataDemo/assets/1819208/39a173bc-c740-4bfe-b3cb-765660e4c39a)
* After you've created your project the following files below will be populated with `SwiftData` boilerplate code.

## `SwiftDataDemoApp`

```swift
import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
```

## `Item`

```swift
import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
```

## `ContentView`

```swift
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
```

## Resources

* [Apple docs: `SwiftData`](https://developer.apple.com/documentation/swiftdata)
