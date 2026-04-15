[ArmorSet]: #armor-sets

# Armor Sets
## Properties
|Property|Type|Description|
|---|---|---|
|id|Integer|The armor set's ID|
|gameId|[GameId](#gameid)|The armor set's ID from the game files|
|name|String|The armor set's name|
|pieces|Array<[Armor](#armor)>|An array of armor pieces belonging to the armor set|
|setBonusSkill|[Skill](#skills)|The skill granted by the set when a certain number of pieces from the same set are worn|
|groupBonusSkill|[Skill](#skills)|The skill granted by the set when a certain number of pieces from the same group are worn|

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
        "setBonusSkill": null,
        "groupBonusSkill": {
            "id": 150,
            "gameId": 1998066176,
            "name": "Fortifying Pelt",
            "ranks": [
                {
                    "skill": {
                        "id": 150
                    },
                    "level": 1,
                    "name": "Fortify",
                    "description": "Increases attack and defense after fainting during a quest. (Can be used twice.)",
                    "setPiecesRequired": 3,
                    "id": 394
                }
            ],
            "description": null,
            "kind": "group",
            "icon": {
                "id": 13,
                "kind": "group"
            }
        },
        "id": 1,
        "gameId": -2117203456
    },
    [...]
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

##### HTTP Request
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
    "setBonusSkill": null,
    "groupBonusSkill": {...},
    "id": 1,
    "gameId": -2117203456
}
```

This endpoint retrieves a single armor set by its ID.

##### HTTP Request
`GET {{URL}}/{locale}/armor/sets/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The armor set's ID|