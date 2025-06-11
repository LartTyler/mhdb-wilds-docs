# Data Types
Included here are data types shared across several parts of the API.

## Scalar Types
```json
{
    "String": "This is a string.",
    "Integer": 123,
    "Float": 12.34,
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
|Float|A floating-point number.|
|Boolean|A boolean value, either `true` or `false`.|
|Percent|An integer indicating a percentage; usually between 0 and 100 inclusive, but some objects (such as motion values) can have values higher than 100%|
|Enum&lt;T>|An enumerated value, restricted to the values specified.|
|Array&lt;T>|An array containing zero or more values of type `T`.|
|DateTime|An [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#Combined_date_and_time_representations) string representing date and time, in UTC.|
|Discriminant&lt;T>|A value of type `T` that indicates which subtype the object represents. See [Union Types](#union-types) for more information.|

## GameId
The game ID type represents an identifier derived from the game files. This value is a 32-bit signed integer, and will
_always_ be stable across updates and imports. Due to the way the API is constructed, an object may change its `id`
field after an import, but objects with a `gameId` field will always use the same value, even if the database were to
be wiped out and rebuilt. Game IDs are always unique identifiers within that object category, however some
[union types](#union-types) (such as weapons) will share game IDs for different [`WeaponKind`](#weaponkinds)s.

If you need long-term persistent storage for an object reference for your application, you should use the object's
game ID if it has one, or the game ID of the nearest parent with one and some unique identifier on the object itself,
such as:

- For [Armor](#armor), store the `gameId` from the [Armor Set](#armor-sets) and the `kind` from the armor.
- For [SkillRanks](#skillrank), store the `gameId` from the [Skill](#skills) and the `level` from the skill rank.

## Position
A 3D coordinate for an object in the game world.

|Property|Type|
|---|---|
|x|Float|
|y|Float|
|z|Float|

## Enum-like
An "enum-like" value is a value that is technically enumerated on the backend, but should probably not be treated that
way in code that uses the API. The best example of this is monster parts: technically, the game does have an enum
for every monster part in the game, and many that are for monsters that are not yet implemented. If you're curious,
the data merger does have that
[represented as an enum](https://github.com/LartTyler/mhdb-wilds-data/blob/ec9986f49350aaf6babcd3b0ddc8c6f889627888/tools/merger/src/processor/monsters.rs#L1033-L1145).

As you can see, that enum is incredibly long, and maybe only half of the variants are used (at the time of writing). As
a rule of thumb, an Enum-like value should be treated like you would a normal enum variant, but you should operate under
the assumption that new variants could be added at any time, possibly without notice. Most of the time, an enum-like
will be accompanied by another value that provides a useful description for the thing represented by the enum-like
value.

Enum-like values will be used very sparingly across this API, and will only appear in cases where limiting a value to a
small number of possible variants is not feasible or does not make sense.

## Rank
An enumerated value, one of the following:

||||
|-|-|-|
|low|high|master|

## Element
An enumerated value, one of the following:

||||
|-|-|-|
|fire|water|ice|
|thunder|dragon||

## Status
An enumerated value, one of the following:

|||||
|-|-|-|-|
|poison|sleep|paralysis|stun|
|blastblight||||

## Effect
An enumerated value, one of the following:

||||
|-|-|-|
|noise|flash|stun|
|exhaust|||

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

## DecorationKind
An enumerated value, one of the following:

|||
|-|-|
|weapon|armor|

## Color
An enumerated value, one of the following:

|||||
|-|-|-|-|
|white|gray|rose|pink|
|red|vermilion|orange|brown|
|ivory|yellow|lemon|sage-green|
|moss-green|green|emerald|sky|
|blue|ultramarine|blue-purple|purple|
|dark-purple||||

## DecorationSlot
Decoration slots are represented by a positive integer indicating the max level of decoration that the slot will accept.
Usually, these levels are provided as an array, with the number of slots on the item indicated by the number of
elements in the array.

```json
{
    "slots": [1, 2]
}
```

### AmmoKind
An enumerated value, one of the following:

||||||
|-|-|-|-|-|
|normal|pierce|spread|slicing|sticky|
|cluster|wyvern|poison|paralysis|sleep|
|flaming|water|freeze|thunder|dragon|
|recover|demon|armor|exhaust|tranq|

## CraftingCost
|Property|Type|Description|
|---|---|---|
|quantity|Integer|The amount of the item required for the craft|
|item|[Item](#items)|The item used as a material for the craft|

## KinsectEssence
An enumerated value (or `null`), one of the following:

||||
|-|-|-|
|white|orange|red|
|green|||

## DamageMultipliers
```json
{
    "slash": 0.45,
    "blunt": 0.5,
    "pierce": 0.45,
    "fire": 0.05,
    "water": 0.1,
    "thunder": 0,
    "ice": 0.15,
    "dragon": 0.05,
    "stun": 0
}
```

Each property on this object is a float between 0 and 1 for each damage type in the game. For example, if `slash` has
a value of `0.45` and an attack would deal a base damage of `100`, the resulting damage would instead be
`100 × 0.45 = 45`.

|Property|Type|Description|
|---|---|---|
|slash|Float|The modifier for slash damage|
|blunt|Float|The modifier for blunt damage|
|pierce|Float|The modifier for pierce damage|
|fire|Float|The modifier for fire damage|
|water|Float|The modifier for water damage|
|thunder|Float|The modifier for thunder damage|
|ice|Float|The modifier for ice damage|
|dragon|Float|The modifier for dragon damage|
|stun|Float|The modifier for stun damage|

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
