# Cardinal Comparison

Conformance seam between
[`swift-cardinal`](https://github.com/swift-atoms/swift-cardinal) and
[`swift-comparison`](https://github.com/swift-atoms/swift-comparison).

The Cardinal atom owns its comparison operators but does not itself declare
`Swift.Comparable`. `Comparison.Protocol` aliases that standard-library
protocol, so this molecule owns the conformance and re-exports both atoms.

```swift
import Cardinal_Comparison

let lower = Cardinal(UInt(2))
let upper = Cardinal(UInt(5))
let ordering = Comparison(lower, upper) // .less
```

## Installation

```swift
dependencies: [
    .package(
        url: "https://github.com/swift-molecules/swift-cardinal-comparison.git",
        branch: "main"
    ),
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Cardinal Comparison", package: "swift-cardinal-comparison"),
    ]
)
```

The package is pre-1.0 and follows the live `main` branches of its atom
dependencies. It requires Swift 6.4 and the Apple 27 platform generation (or a
matching Linux or Windows toolchain).
