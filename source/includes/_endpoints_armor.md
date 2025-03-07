[Armor]: #armor
[ArmorSet]: #armor-sets
[SkillRank]: #skillrank

# Armor
## Properties
|Property|Type|Description|
|---|---|---|
|id|Integer|The armor's ID|
|name|String|The armor's name|
|description|String|The armor's description|
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
        "kind": "head",
        "name": "Conga Helm α",
        "description": "Head armor made from Congalala materials. Remember: it's \"feral,\" not \"unkempt.\"",
        "rank": "high",
        "rarity": 5,
        "resistances": {
            "fire": -3,
            "water": 1,
            "ice": -1,
            "thunder": 1,
            "dragon": 2
        },
        "defense": {
            "base": 36,
            "max": 60
        },
        "skills": [
            {
                "skill": {
                    "id": 104,
                    "gameId": 850626240,
                    "name": "Free Meal"
                },
                "level": 1,
                "description": "Activates 10% of the time.",
                "id": 267
            },
            [...]
        ],
        "slots": [
            1
        ],
        "armorSet": {
            "id": 1,
            "name": "Conga α"
        },
        "crafting": {
            "armor": {
                "id": 1
            },
            "materials": [
                {
                    "item": {
                        "id": 464,
                        "gameId": 509,
                        "rarity": 6,
                        "name": "Congalala Pelt+",
                        "description": "High-quality Congalala fur. Stout and resilient, an important crafting material once processed.",
                        "value": 930,
                        "carryLimit": 99,
                        "recipes": []
                    },
                    "quantity": 2,
                    "id": 1
                },
                [...]
            ],
            "zennyCost": 3000,
            "id": 1
        },
        "id": 1
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
    "kind": "head",
    "name": "Conga Helm α",
    "description": "Head armor made from Congalala materials. Remember: it's \"feral,\" not \"unkempt.\"",
    "rank": "high",
    "rarity": 5,
    "resistances": {
        "fire": -3,
        "water": 1,
        "ice": -1,
        "thunder": 1,
        "dragon": 2
    },
    "defense": {
        "base": 36,
        "max": 60
    },
    "skills": [
        {
            "skill": {
                "id": 104,
                "gameId": 850626240,
                "name": "Free Meal"
            },
            "level": 1,
            "description": "Activates 10% of the time.",
            "id": 267
        },
        [...]
    ],
    "slots": [
        1
    ],
    "armorSet": {
        "id": 1,
        "name": "Conga α"
    },
    "crafting": {
        "armor": {
            "id": 1
        },
        "materials": [
            {
                "item": {
                    "id": 464,
                    "gameId": 509,
                    "rarity": 6,
                    "name": "Congalala Pelt+",
                    "description": "High-quality Congalala fur. Stout and resilient, an important crafting material once processed.",
                    "value": 930,
                    "carryLimit": 99,
                    "recipes": []
                },
                "quantity": 2,
                "id": 1
            },
            [...]
        ],
        "zennyCost": 3000,
        "id": 1
    },
    "id": 1
}
```

This endpoint retrieves a single armor object by its ID.

#### HTTP Request
`GET {{URL}}/en/armor/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The armor's ID|