[ArmorSet]: #armor-sets

# Armor Sets
## Properties
|Property|Type|Description|
|---|---|---|
|id|Integer|The armor set's ID|
|name|String|The armor set's name|
|pieces|Array<[Armor](#armor)>|An array of armor pieces belonging to the armor set|
|bonus|[ArmorSetBonus](#armorsetbonus)|An array of bonuses given by the set when a certain number of pieces are worn|

### ArmorSetBonus
|Property|Type|Description|
|---|---|---|
|id|Integer|The bonus's ID|
|name|String|The name of the armor set bonus|
|ranks|Array<[ArmorSetBonusRank](#armorsetbonusrank)>|The different ranks of the bonus|

### ArmorSetBonusRank
|Property|Type|Description|
|---|---|---|
|id|Integer|The rank's ID|
|pieces|Integer|The number of armor pieces from the set that must be worn to activate the bonus|
|skill|[SkillRank](#skillrank)|The skill granted by this rank of the bonus|

## List all armor sets
```shell
curl "{{URL}}/en/armor/sets"
```

> Returns an array of [ArmorSet] objects.

```json
[
    {
        "id": 1,
        "rank": "low",
        "name": "Leather",
        "pieces": [
            {
                "id": 1,
                "type": "head",
                "rank": "low",
                "rarity": 1,
                "attributes": {},
                "defense": {
                    "base": 2,
                    "max": 38,
                    "augmented": 68
                },
                "resistances": {
                    "fire": 2,
                    "water": 0,
                    "ice": 0,
                    "thunder": 0,
                    "dragon": 0
                },
                "name": "Leather Headgear",
                "slots": [],
                "skills": [
                    {
                        "id": 207,
                        "level": 1,
                        "modifiers": {},
                        "skill": 67,
                        "description": "Extends the time until your stamina cap decreases by 50%.",
                        "skillName": "Hunger Resistance"
                    }
                ],
                "armorSet": {
                    "id": 1
                },
                "crafting": {
                    "zennyCost": 100,
                    "materials": [...]
                }
            },
            [...]
        ],
        "bonus": null
    },
    [...]
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

#### HTTP Request
`GET {{URL}}/{locale}/armor/sets`

## Retrieve an armor set
```shell
curl "{{URL}}/en/armor/sets/1"
```

> Returns a single [ArmorSet] object.

```json
{
    "id": 1,
    "rank": "low",
    "name": "Leather",
    "pieces": [
        {
            "id": 1,
            "type": "head",
            "rank": "low",
            "rarity": 1,
            "attributes": {},
            "defense": {
                "base": 2,
                "max": 38,
                "augmented": 68
            },
            "resistances": {
                "fire": 2,
                "water": 0,
                "ice": 0,
                "thunder": 0,
                "dragon": 0
            },
            "name": "Leather Headgear",
            "slots": [],
            "skills": [
                {
                    "id": 207,
                    "level": 1,
                    "skill": {
                        "id": 67,
                        "name": "Hunger Resistance"
                    },
                    "description": "Extends the time until your stamina cap decreases by 50%.",
                }
            ],
            "armorSet": {
                "id": 1
            },
            "crafting": {
                "zennyCost": 100,
                "materials": [...]
            }
        },
        [...]
    ],
    "bonus": null
}
```

This endpoint retrieves a single armor set by its ID.

#### HTTP Request
`GET {{URL}}/{locale}/armor/sets/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The armor set's ID|