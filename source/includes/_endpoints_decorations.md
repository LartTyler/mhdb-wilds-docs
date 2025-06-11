[Decoration]: #decorations

# Decorations
## Properties
|Property|Type|Description|
|---|---|---|
|id|Integer|the decoration's ID|
|gameId|[GameId](#gameid)|The decoration's ID from the game files|
|name|String|The decoration's name|
|description|String|The decoration's description|
|slot|Integer|The minimum level of the slot the decoration can be placed in|
|rarity|Integer|The decoration's rarity|
|kind|[DecorationKind](#decorationkind)|What equipment group the decoration is allowed to be used on|
|skills|Array<[SkillRank](#skillrank)>|The skills granted by this decoration|
|icon|[DecorationIcon](#decorationicon)|Icon information|

### DecorationIcon
|Property|Type|Description|
|---|---|---|
|color|[Color](#color)|The string representation of the icon's color|
|colorId|[GameId](#gameid)|The ID used by the game files to identify the icon's color|

## List all decorations
```shell
curl "{{URL}}/en/decorations"
```

> Returns an array of [Decoration] objects.

```json
[
    {
        "name": "Venom Jewel [1]",
        "description": "A decoration that grants the Poison Attack skill.",
        "value": 150,
        "slot": 1,
        "rarity": 3,
        "kind": "weapon",
        "skills": [
            {
                "skill": {
                    "id": 12,
                    "name": "Poison Attack"
                },
                "level": 1,
                "description": "Poison buildup +5% Bonus: +10",
                "id": 25
            }
        ],
        "icon": {
            "color": "purple",
            "colorId": 20
        },
        "id": 1,
        "gameId": -2144349312
    },
    [...]
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

##### HTTP Request
`GET {{URL}}/{locale}/decorations`

## Retrieve a decoration
```shell
curl "{{URL}}/en/decorations/1"
```

> Returns a single [Decoration] object.

```json
{
    "name": "Venom Jewel [1]",
    "description": "A decoration that grants the Poison Attack skill.",
    "value": 150,
    "slot": 1,
    "rarity": 3,
    "kind": "weapon",
    "skills": [
        {
            "skill": {
                "id": 12,
                "name": "Poison Attack"
            },
            "level": 1,
            "description": "Poison buildup +5% Bonus: +10",
            "id": 25
        }
    ],
    "icon": {
        "color": "purple",
        "colorId": 20
    },
    "id": 1,
    "gameId": -2144349312
}
```

Retrieves a decoration by its ID.

##### HTTP Request
`GET {{URL}}/{locale}/decorations/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The decoration's ID|