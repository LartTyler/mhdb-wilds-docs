[Decoration]: #decorations

# Decorations
## Properties
|Property|Type|Description|
|---|---|---|
|id|Integer|the decoration's ID|
|name|String|The decoration's name|
|slot|Integer|The minimum level of the slot the decoration can be placed in|
|rarity|Integer|The decoration's rarity|
|skills|Array<[SkillRank](#skillrank)>|The skills granted by this decoration|

## List all decorations
```shell
curl "{{URL}}/en/decorations"
```

> Returns an array of [Decoration] objects.

```json
[
    {
        "id": 1,
        "rarity": 5,
        "slot": 1,
        "name": "Antidote Jewel 1",
        "skills": [
            {
                "id": 1,
                "level": 1,
                "description": "Reduces the number of times you take poison damage.",
                "skill": {
                    "id": 1,
                    "name": "Poison Resistance"
                }
            }
        ]
    },
    [...]
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

#### HTTP Request
`GET {{URL}}/{locale}/decorations`

## Retrieve a decoration
```shell
curl "{{URL}}/en/decorations/1"
```

> Returns a single [Decoration] object.

```json
{
    "id": 1,
    "rarity": 5,
    "slot": 1,
    "name": "Antidote Jewel 1",
    "skills": [
        {
            "id": 1,
            "level": 1,
            "description": "Reduces the number of times you take poison damage.",
            "skill": {
                "id": 1,
                "name": "Poison Resistance"
            }
        }
    ]
}
```

Retrieves a decoration by its ID.

#### HTTP Request
`GET {{URL}}/{locale}/decorations/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The decoration's ID|