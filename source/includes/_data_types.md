# Data Types
Included here are data types shared across several parts of the API.

## Scalar Types
```json
{
    "String": "This is a string.",
    "Integer": 123,
    "Boolean": true,
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
|Enum<T>|An enumerated value, restricted to the values specified.|
|Array<T>|An array containing zero or more values of type `T`.|
|DateTime|An [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#Combined_date_and_time_representations) string representing date and time, in UTC.|

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
|dragon|blast|poison|sleep|
|paralysis|stun|||

## RewardConditionKind
An enumerated value, one of the following:

|||||
|-|-|-|-|
|carve|mining|palico|reward|
|shiny|track|wound||

## CraftingCost
|Property|Type|Description|
|---|---|---|
|id|Integer|ID|
|quantity|Integer|The amount of the item required for the craft|
|item|[Item](#items)|The item used as a material for the craft|