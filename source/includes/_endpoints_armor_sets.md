[ArmorSet]: #armor-sets

# Armor Sets
## Properties
|Property|Type|Description|
|---|---|---|
|id|Integer|The armor set's ID|
|gameId|[GameId](#gameid)|The armor set's ID from the game files|
|name|String|The armor set's name|
|pieces|Array<[Armor](#armor)>|An array of armor pieces belonging to the armor set|
|bonus|[ArmorSetBonus](#armorsetbonus)|The skill granted by the set when a certain number of pieces from the same set are worn|
|groupBonus|[ArmorSetBonus](#armorsetbonus)|The skill granted by the set when a certain number of pieces from the same group are worn|

### ArmorSetBonus
|Property|Type|Description|
|---|---|---|
|id|Integer|The bonus's ID|
|skill|[Skill](#skills)|The skill granted by the bonus|
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
        "name": "Conga α",
        "pieces": [...],
        "bonus": null,
        "groupBonus": {
            "id": 1,
            "skill": {
                "id": 142,
                "name": "Fortifying Pelt"
            },
            "ranks": [
                {
                    "bonus": {
                        "id": 1
                    },
                    "pieces": 3,
                    "skill": {
                        "id": 381,
                        "skill": {
                            "id": 142
                        },
                        "level": 1,
                        "description": "Increases attack and defense after fainting during a quest. (Can be used twice.)"
                    },
                    "id": 1
                }
            ]
        },
        "id": 1,
        "gameId": -2117203456
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
    "name": "Conga α",
    "pieces": [...],
    "bonus": null,
    "groupBonus": {
        "id": 1,
        "skill": {
            "id": 142,
            "name": "Fortifying Pelt"
        },
        "ranks": [
            {
                "bonus": {
                    "id": 1
                },
                "pieces": 3,
                "skill": {
                    "id": 381,
                    "skill": {
                        "id": 142
                    },
                    "level": 1,
                    "description": "Increases attack and defense after fainting during a quest. (Can be used twice.)"
                },
                "id": 1
            }
        ]
    },
    "id": 1,
    "gameId": -2117203456
}
```

This endpoint retrieves a single armor set by its ID.

#### HTTP Request
`GET {{URL}}/{locale}/armor/sets/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The armor set's ID|