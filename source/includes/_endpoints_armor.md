[Armor]: #armor
[ArmorSet]: #armor-sets
[SkillRank]: #skillrank

# Armor
## Properties
|Property|Type|Description|
|---|---|---|
|id|Integer|The armor's ID|
|name|String|The armor's name|
|kind|Enum<[ArmorKind](#armorkind)>|The slot the armor is worn in|
|rank|Enum<[Rank](#rank)>|The armor's hunter rank group|
|rarity|Integer|The armor's rarity value|
|defense|[ArmorDefense](#armordefense)|The armor's defense values at certain breakpoints|
|resistances|[ArmorResistances](#armorresistances)|The armor's elemental resistances|
|slots|Array&lt;Integer>|The decoration slots supported by the armor; the position in the array indicates which slot is being defined (i.e. the first element is the first slot), and the value is the maximum level of allowed decoration|
|skills|Array<[SkillRank]>|An array of `SkillRank`s granted by the armor|
|armorSet|[ArmorSet]|The set that the armor belongs to, if any|
|crafting|[ArmorCrafting](#armorcrafting)|Crafting information for the armor|

### ArmorKind
An enumerated value, one of:

||||
|-|-|-|
|head|chest|arms|
|waist|legs||

### ArmorDefense
|Property|Type|Description|
|---|---|---|
|base|Integer|The armor's base defense value|
|max|Integer|The armor's maximum, un-augmented defense value|
|augmented|Integer|The armor's fully upgraded defense value|

### ArmorResistances
|Property|Type|Description|
|---|---|---|
|fire|Integer|Fire resistance|
|water|Integer|Water resistance|
|ice|Integer|Ice resistance|
|thunder|Integer|Thunder resistance|
|dragon|Integer|Dragon resistance|

### ArmorCrafting
|Property|Type|Description|
|---|---|---|
|id|Integer|The crafting data ID|
|zennyCost|Integer|The amount of zenny it costs to craft the armor|
|materials|Array<[CraftingCost](#craftingcost)>|An array of materials used to craft the armor|

## List all armor
```shell
curl "{{URL}}/en/armor"
```

> Returns an array of [Armor] objects.

```json
[
    {
        "id": 1,
        "name": "Leather Headgear",
        "kind": "head",
        "rank": "low",
        "rarity": 1,
        "defense": {
            "base": 2,
            "max": 38,
            "augmented": 68
        },
        [...]
    },
    [...]
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

#### HTTP Request
`GET {{URL}}/{locale}/armor`

## Retrieve an armor
```shell
curl "{{URL}}/en/armor/1"
```

> Returns a single [Armor] object.

```json
{
    "id": 1,
    "name": "Leather Headgear",
    "kind": "head",
    "rank": "low",
    "rarity": 1,
    "defense": {
        "base": 2,
        "max": 38,
        "augmented": 68
    },
    [...]
}
```

This endpoint retrieves a single armor object by its ID.

#### HTTP Request
`GET {{URL}}/en/armor/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The armor's ID|