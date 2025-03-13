[Charm]: #charms

# Charms
## Properties
|Property|Type|Description|
|---|---|---|
|id|Integer|The charm's ID|
|gameId|[GameId](#gameid)|The ID used in the game files to identify the charm|
|ranks|Array<[CharmRank](#charmrank)>|An array levels the charm can be obtained at|

### CharmRank
|Property|Type|Description|
|---|---|---|
|id|Integer|The ID of the charm rank|
|name|String|The rank's name|
|description|String|The rank's description|
|level|Integer|The level of the rank|
|rarity|Integer|The rank's rarity|
|skills|Array<[SkillRank](#skillrank)>|An array of skills that are granted by this charm|
|crafting|[CharmRankCrafting](#charmrankcrafting)|Crafting info for this charm|

### CharmRankCrafting
|Property|Type|Description|
|---|---|---|
|craftable|Boolean|Indicates if the rank can be crafted directly; `false` indicates that the rank must be upgraded from the previous|
|zennyCost|Integer|The amount of zenny the crafting operation costs|
|materials|Array<[CraftingCost](#craftingcost)>|An array of materials used to craft the charm|

## List all charms
```shell
curl "{{URL}}/en/charms"
```

> Returns an array of [Charm] objects.

```json
[
    {
        
        "id": 1,
        "gameId": -2084662144,
        "ranks": [
            {
                "charm": {
                    "id": 1
                },
                "name": "Windproof Charm I",
                "description": "A charm that grants the Windproof skill.",
                "level": 1,
                "rarity": 4,
                "skills": [
                    {
                        "skill": {
                            "id": 34,
                            "name": "Windproof"
                        },
                        "level": 1,
                        "description": "Negates minor wind pressure and halves the effects of major wind pressure.",
                        "id": 77
                    }
                ],
                "crafting": {
                    "charmRank": {
                        "id": 1
                    },
                    "craftable": true,
                    "materials": [
                        {
                            "item": {
                                "id": 53,
                                "gameId": 55,
                                "rarity": 4,
                                "name": "Dragonite Ore",
                                "description": "Ore sourced from mining outcrops. A rare material coveted for its durability in armor crafting.",
                                "value": 480,
                                "carryLimit": 10,
                                "recipes": []
                            },
                            "quantity": 2,
                            "id": 1656
                        },
                        [...]
                    ],
                    "zennyCost": 1500,
                    "id": 1
                },
                "id": 1
            },
            [...]
        ]
    },
    [...]
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

##### HTTP Request
`GET {{URL}}/{locale}/charms`

## Retrieve a charm
```shell
curl "{{URL}}/en/charms/1"
```

> Returns a single [Charm] object.

```json
{
    "id": 1,
    "gameId": -2084662144,
    "ranks": [
        {
            "charm": {
                "id": 1
            },
            "name": "Windproof Charm I",
            "description": "A charm that grants the Windproof skill.",
            "level": 1,
            "rarity": 4,
            "skills": [
                {
                    "skill": {
                        "id": 34,
                        "name": "Windproof"
                    },
                    "level": 1,
                    "description": "Negates minor wind pressure and halves the effects of major wind pressure.",
                    "id": 77
                }
            ],
            "crafting": {
                "charmRank": {
                    "id": 1
                },
                "craftable": true,
                "materials": [
                    {
                        "item": {
                            "id": 53,
                            "gameId": 55,
                            "rarity": 4,
                            "name": "Dragonite Ore",
                            "description": "Ore sourced from mining outcrops. A rare material coveted for its durability in armor crafting.",
                            "value": 480,
                            "carryLimit": 10,
                            "recipes": []
                        },
                        "quantity": 2,
                        "id": 1656
                    },
                    [...]
                ],
                "zennyCost": 1500,
                "id": 1
            },
            "id": 1
        },
        [...]
    ]
}
```

This endpoint retrieves a charm by its ID.

##### HTTP Request
`GET {{URL}}/{locale}/charms/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The charm's ID|