[Charm]: #charms

# Charms
|Property|Type|Description|
|---|---|---|
|id|Integer|The charm's ID|
|name|String|The charm's name|
|ranks|Array<[CharmRank](#charmrank)>|An array levels the charm can be obtained at|

### CharmRank
|Property|Type|Description|
|---|---|---|
|id|Integer|The ID of the charm rank|
|name|String|The rank's name|
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
        "id": 234,
        "name": "Poison Charm",
        "ranks": [
            {
                "level": 1,
                "rarity": 3,
                "name": "Poison Charm 1",
                "skills": [
                    {
                        "id": 1,
                        "level": 1,
                        "description": "Reduces the number of [...]",
                        "skill": {
                            "id": 1,
                            "name": "Poison Resistance"
                        }
                    }
                ],
                "crafting": {
                    "craftable": true,
                    "materials": [
                        {
                            "quantity": 1,
                            "item": {
                                "id": 231,
                                "rarity": 4,
                                "carryLimit": 99,
                                "value": 660,
                                "name": "Pukei-Pukei Sac",
                                "description": "Pukei-Pukei material. Obtained [...]"
                            }
                        },
                        [...]
                    ]
                }
            },
            [...]
        ]
    },
    [...]
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

### HTTP Request
`GET {{URL}}/{locale}/charms`

## Retrieve a charm
```shell
curl "{{URL}}/en/charms/1"
```

> Returns a single [Charm] object.

```json
{
    "id": 234,
    "name": "Poison Charm",
    "ranks": [
        {
            "level": 1,
            "rarity": 3,
            "name": "Poison Charm 1",
            "skills": [
                {
                    "id": 1,
                    "level": 1,
                    "description": "Reduces the number of [...]",
                    "skill": {
                        "id": 1,
                        "name": "Poison Resistance"
                    }
                }
            ],
            "crafting": {
                "craftable": true,
                "materials": [
                    {
                        "quantity": 1,
                        "item": {
                            "id": 231,
                            "rarity": 4,
                            "carryLimit": 99,
                            "value": 660,
                            "name": "Pukei-Pukei Sac",
                            "description": "Pukei-Pukei material. Obtained [...]"
                        }
                    },
                    [...]
                ]
            }
        },
        [...]
    ]
}
```

This endpoint retrieves a charm by its ID.

### HTTP Request
`GET {{URL}}/{locale}/charms/{id}`

### URL Parameters
|Parameter|Type|Description|
|---|---|---|
|id|Integer|The charm's ID|