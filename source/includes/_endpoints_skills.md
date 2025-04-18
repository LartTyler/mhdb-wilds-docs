[Skill]: #skills

# Skills
## Properties
|Property|Type|Description|
|---|---|---|
|id|Integer|The skill's ID|
|name|String|The skill's name|
|description|String|The skill's description; will be `null` for set and group bonus skills|
|ranks|Array<[SkillRank](#skillrank)>|An array of possible levels for the skill|
|kind|[SkillKind](#skillkind)|Where a skill can be found|
|icon|[SkillIcon](#skillicon)|Icon information|

### SkillKind
An enumerated value, one of the following:

|Value|Description|
|---|---|
|armor|Skill can be found on armor|
|weapon|Skill can be found on weapons|
|set|Skill can be found in armor set bonuses|
|group|Skill can be found in armor group bonuses|

### SkillIcon
|Property|Type|Description|
|---|---|---|
|id|[GameId](#gameid)|The ID used by the game files to identify the icon|
|kind|[SkillIconKind](#skilliconkind)|The string representation of the icon; will be used in the future to identify asset files|

### SkillIconKind
An enumerated value, one of the following:

|||||  
|---|---|---|---|  
|affinity|attack|defense|element|  
|gathering|group|handicraft|health|  
|item|offense|ranged|set|  
|stamina|utility|||

### SkillRank
|Property|Type|Description|
|---|---|---|
|id|Integer|The skill rank's ID|
|name|String|The rank's name; always `null` except for on set and group bonus skills|
|description|String|The rank's description|
|level|Integer|The skill level of the rank|

## List all skills
```shell
curl "{{URL}}/en/skills"
```

> Returns an array of [Skill] objects.

```json
[
    {
        "name": "Dragon Resistance",
        "kind": "armor",
        "description": "Increases dragon resistance. Also improves [...]",
        "ranks": [
            {
                "skill": {
                    "id": 1
                },
                "level": 1,
                "name": null,
                "description": "Dragon resistance +6",
                "id": 1
            },
            [...]
        ],
        "icon": {
            "id": 6,
            "kind": "defense"
        },
        "id": 1,
        "gameId": -2125233152
    }
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

##### HTTP Request
`GET {{URL}}/{locale}/skills`

## Retrieve a skill
```shell
curl "{{URL}}/en/skills/1"
```

> Returns a single [Skill] object.

```json
{
    "name": "Dragon Resistance",
    "kind": "armor",
    "description": "Increases dragon resistance. Also improves [...]",
    "ranks": [
        {
            "skill": {
                "id": 1
            },
            "level": 1,
            "name": null,
            "description": "Dragon resistance +6",
            "id": 1
        },
        [...]
    ],
    "icon": {
        "id": 6,
        "kind": "defense"
    },
    "id": 1,
    "gameId": -2125233152
}
```

##### HTTP Request
`GET {{URL}}/{locale}/skills/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The skill's ID|