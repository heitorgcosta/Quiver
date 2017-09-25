# Quiver

[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://opensource.org/licenses/MIT)

Quiver is a library that provides an easy way to validate, search and filter objects.

# Installation

## Cocoapods
```
pod 'Quiver', :git => 'https://github.com/heitorgcosta/Quiver.git'
```
  
# Usage

## Validating

Objects can be easily validated by implementing the `Validatable` protocol.
To do so, `validations(mapper:)` must be implemented. The mapping is made with the new Swift 4 smart keypaths.

```swift
struct Person {
    var name: String?
    var age: Int?
}

extension Person: Validatable {
    func validations(mapper: ValidatorMapper) {
        // Name is required and must be at least 4 characters long.
        mapper[\Person.name] = [.required(),
                                .length(min: 4)]

        // Age is required and must be 18 or over
        mapper[\Person.age] = [.required(),
                               .greaterOrEqual(to: 18)]
    }
}
```

Any object implementing `Validatable` can call `validate()`, which returns a result object.

```swift
let person = Person(name: "Hector", age: 23)
let result = person.validate()

print(result.success) // Prints 'true'
```

The results also contains the errors occurred.

```swift
let person = Person(name: "Hector", age: nil) 
let result = person.validate()

print(result.success) // Prints 'false'
print(result.error.items.count) // Prints 1, since it does not fulfill the 'required' validation
```

Also, each validator can contain a custom message defined by you.

```swift
extension Person: Validatable {
    func validations(mapper: ValidatorMapper) {
        mapper[\Person.name] = [.required(message: "The name is required"),
                                .length(min: 4, message: "The name should be at least 4 characters long")]

        mapper[\Person.age] = [.required(message: "The age is required"),
                               .greaterOrEqual(to: 18, message: "The age should be 18 or over")]
    }
}

let person = Person(name: "Heitor", age: 17)
let result = person.validate()

print(result.error.firstItem?.message ?? "No errors found") // Will print 'The age should be 18 or over'
```

Validators are still in the beginning and more will be added in the future.

## Searching

First, objects to be searched must implement the `Searchable` protocol. The `searchableFields()` function should return all searchable properties.

```swift
struct Person {
    var name: String
    var age: Int
}

extension Person: Searchable {
    func searchableFields() -> [Any?] {
        return [name, age]
    }
}
```

Then, any array of this object can use the `search()` function to get an array with the matching results.

```swift
// If any searchable field of a person contains "John", it is returned in the result array.

let results = personsArray.search(with: "John") // Search is not case sensitive by default.
let caseSensitiveResults = personsArray.search(with: "John", caseSensitive: true) // Explicit case sensitivity
```

## Filtering

An array of objects can be filtered using the validators included in this library using the `filter(by:with:)`, using a keypath and an array of validators.

```swift
let persons: [Person] = [] // Just imagine a great collection of persons
let filtered = persons.filter(by: \Person.name, with: [.length(min: 4)]) // Filter persons that contains name with length of at least 4 characters
```

# Licence 

Quiver is released under the [MIT License](https://opensource.org/licenses/MIT).