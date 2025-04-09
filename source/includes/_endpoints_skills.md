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

### SkillKind
An enumerated value, one of the following:

|Value|Description|
|---|---|
|armor|Skill can be found on armor|
|weapon|Skill can be found on weapons|
|set|Skill can be found in armor set bonuses|
|group|Skill can be found in armor group bonuses|

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
        "id": 1,
        "name": "Poison Resistance",
        "description": "Reduces damage while poisoned.",
        "ranks": [
            {
                "id": 1,
                "skill": {
                    "id": 1
                },
                "level": 1,
                "description": "Reduces the number of times you take poison damage.",
            },
            [...]
        ]
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
    "id": 1,
    "name": "Poison Resistance",
    "description": "Reduces damage while poisoned.",
    "ranks": [
        {
            "id": 1,
            "skill": {
                "id": 1
            },
            "level": 1,
            "description": "Reduces the number of times you take poison damage.",
        },
        [...]
    ]
}
```

##### HTTP Request
`GET {{URL}}/{locale}/skills/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The skill's ID|