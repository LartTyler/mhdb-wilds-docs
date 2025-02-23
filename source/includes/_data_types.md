# Data Types
Included here are data types shared across several parts of the API.

## Scalar Types
```json
{
    "String": "This is a string.",
    "Integer": 123,
    "Boolean": true,
    "Percent": "48",
    "Enum<Element>": "fire",
    "Array<Element>": ["fire", "water"],
    "DateTime": "2025-02-22T00:00:00Z"
}
```

|Type|Description|
|---|---|
|String|Text of any length; fields with this type are localized, and may be `null` if a value has not been set for your selected locale.|
|Integer|A whole number.|
|Boolean|A boolean value, either `true` or `false`.|
|Percent|An integer indicating a percentage; usually between 0 and 100 inclusive, but some objects (such as motion values) can have values higher than 100%|
|Enum&lt;T>|An enumerated value, restricted to the values specified.|
|Array&lt;T>|An array containing zero or more values of type `T`.|
|DateTime|An [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#Combined_date_and_time_representations) string representing date and time, in UTC.|
|Discriminant&lt;T>|A value of type `T` that indicates which subtype the object represents. See [Union Types](#union-types) for more information.|

## Rank
An enumerated value, one of the following:

||||
|-|-|-|
|low|high|master|

## Element
An enumerated value, one of the following:

|||||
|-|-|-|-|
|fire|water|ice|thunder|
|dragon|blast|||

## Status
An enumerated value, one of the following:

|||||
|-|-|-|-|
|poison|sleep|paralysis|stun|

## RewardConditionKind
An enumerated value, one of the following:

|||||
|-|-|-|-|
|carve|mining|palico|reward|
|shiny|track|wound||

## DamageKind
An enumerated value, one of the following:

||||
|-|-|-|
|severing|blunt|projectile|

## Elderseal
An enumerated value, one of the following:

|||
|-|-|
|low|average|
|high||

## DecorationSlot
Decoration slots are represented by a positive integer indicating the max level of decoration that the slot will accept.
Usually, these levels are provided as an array, with the number of slots on the item indicated by the number of
elements in the array.

```json
{
    "slots": [1, 2]
}
```

## CraftingCost
|Property|Type|Description|
|---|---|---|
|quantity|Integer|The amount of the item required for the craft|
|item|[Item](#items)|The item used as a material for the craft|

## Union Types
```json
{
    "kind": "car",
    "manufacturer": "Nissan",
    "year": 2025,
    "vin": "123ABCXYZ",
    "wheels": 4
}

{
    "kind": "boat",
    "manufacturer": "Tidewater",
    "year": 2020,
    "motor": "outboard",
    "horsepower": 600
}
```

More properly called a "tagged union" in the context of this API, a union type uses a special field to indicate which
of several discrete types an object actually represents.

In the example on the right, we have two objects that share several fields. Our supertype for the union might be
`Vehicle`, with shared fields present on the supertype (in our example, `manufacturer` and `year`). The `kind` field
indicates which of our two subtypes (`Car` or `Boat`) the object actually represents; if `kind` is set to "car", we know
that the car-specific fields `vin` and `wheels` will be present, likewise if the value is "boat".
