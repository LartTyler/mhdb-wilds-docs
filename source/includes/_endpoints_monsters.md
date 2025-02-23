[Monster]: #monsters

# Monsters
|Property|Type|Description|
|---|---|---|
|id|Integer|The monster's ID|
|kind|Enum<[MonsterKind](#monsterkind)>|The monster's category|
|species|Enum<[Species](#species)>|The monster's species|
|name|String|The monster's name|
|description|String|The monster's description|
|locations|Array<[Location](#locations)>|The locations in which the monster can be found|
|ailments|Array<[Ailment](#ailments)>|Which ailments the monster can inflict|
|elements|Array<[Element](#element)>|An array of elemental damage types the monster can inflict|
|resistances|Array<[MonsterResistance](#monsterresistance)>|The monster's elemental and status resistances|
|weaknesses|Array<[MonsterWeakness](#monsterweakness)>|The monster's elemental and status weaknesses|
|rewards|Array<[MonsterReward](#monsterreward)>|Items can be obtained from fighting the monster|

### MonsterKind
An enumerated value, one of:

|||
|-|-|
|small|large|

### Species
An enumerated value, one of:

|||||
|-|-|-|-|
|bird wyvern|brute wyvern|elder dragon|fanged wyvern|
|fish|flying wyvern|herbivore|lynian|
|neopteron|piscine wyvern|relict|wingdrake|
|fanged beast||||

### MonsterResistance
A union type, identified by the `kind` field.

|Property|Type|Description|
|---|---|---|
|id|Integer|The resistance's ID|
|condition|String|The condition or status of the monster during which this resistance is active; a `null` value indicates the resistance is always active|
|kind|Discriminant<[ResistanceKind](#resistancekind)>|The discriminant for the [tagged union](#union-types)|

### ResistanceKind
The discriminant for the [MonsterResistance](#monsterresistance) [tagged union](#union-types).

|Value|Subtype|
|---|---|
|element|[ElementResistance](#elementresistance)|
|status|[StatusResistance](#statusresistance)|

### ElementResistance
|Property|Type|Description|
|---|---|---|
|element|[Element](#element)|The element the monster is resistant to|

### StatusResistance
|Property|Type|Description|
|---|---|---|
|status|[Status](#status)|The status the monster is resistant to|

### MonsterWeakness
A union type, identified by the `kind` field.

|Property|Type|Description|
|---|---|---|
|id|Integer|The weakness's ID|
|level|Integer|How powerful the weakness is; higher values indicate a more severe weakness|
|condition|String|The condition or status of the monster during which this weakness applies; a `null` value indicates that the weakness is always active|
|kind|Discriminant<[WeaknessKind](#weaknesskind)>|The discriminant for the [tagged union](#union-types)|

### WeaknessKind
The discriminant for the [MonsterWeakness](#monsterweakness) [tagged union](#union-types).

|Value|Subtype|
|---|---|
|element|[ElementWeakness](#elementweakness)|
|status|[StatusWeakness](#statusweakness)|

### ElementWeakness
|Property|Type|Description|
|---|---|---|
|element|[Element](#element)|The element the monster is weak to|

### StatusWeakness
|Property|Type|Description|
|---|---|---|
|status|[Status](#status)|The status the monster is weak to|

### MonsterReward
|Property|Type|Description|
|---|---|---|
|item|[Item](#items)|The item given by the reward|
|conditions|Array<[RewardCondition](#rewardcondition)>|An array of conditions required for the reward to be granted|

### RewardCondition
|Property|Type|Description|
|---|---|---|
|kind|[RewardConditionKind](#rewardconditionkind)|The type of reward this is (such as a carve, wound, etc.)|
|rank|[Rank](#rank)|The hunter rank group for the reward|
|quantity|Integer|The base amount of the item that can be given by the reward|
|chance|Percent|How likely it is that the reward will be given|
|subtype|String|A description of additional conditions or situations for the reward. For example, for the "wound" condition, the subtype might describe which part of the monster must be wounded for this reward|

### RewardConditionKind
An enumerated value, one of:

|||||
|-|-|-|-|
|carve|investigation|mining|palico|
|reward|shiny|track|wound|

## List all monsters
```shell
curl "{{URL}}/en/monsters"
```

> Returns an array of [Monster] objects.

```json
[
    {
        "id": 20,
        "kind": "large",
        "species": "brute wyvern",
        "elements": [],
        "name": "Barroth",
        "description": "Barroth seek out [...]",
        "ailments": [...],
        "locations": [...],
        "resistances": [
            {
                "kind": "element",
                "element": "fire",
                "condition": "covered in mud"
            },
            {
                "kind": "element",
                "element": "water",
                "condition": null
            },
            [...]
        ],
        "weaknesses": [
            {
                "kind": "element",
                "element": "fire",
                "level": 3,
                "condition": null
            },
            {
                "kind": "element",
                "element": "water",
                "level": 3,
                "condition": "covered in mud"
            },
            [...]
        ],
        "rewards": [
            {
                "id": 22,
                "item": {
                    "id": 148,
                    "rarity": 4,
                    "carryLimit": 99,
                    "value": 300,
                    "name": "Monster Bone M",
                    "description": "Bone obtained from [...]"
                },
                "conditions": [
                    {
                        "kind": "reward",
                        "rank": "low",
                        "quantity": 1,
                        "chance": 13,
                        "subtype": null
                    }
                ]
            },
            [...]
        ]
    }
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

### HTTP Request
`GET {{URL}}/{locale}/monsters`

## Retrieve a monster
```shell
curl "{{URL}}/en/monsters/20"
```

> Returns a single [Monster] object.

```json
{
    "id": 20,
    "kind": "large",
    "species": "brute wyvern",
    "elements": [],
    "name": "Barroth",
    "description": "Barroth seek out [...]",
    "ailments": [...],
    "locations": [...],
    "resistances": [
        {
            "kind": "element",
            "element": "fire",
            "condition": "covered in mud"
        },
        {
            "kind": "element",
            "element": "water",
            "condition": null
        },
        [...]
    ],
    "weaknesses": [
        {
            "kind": "element",
            "element": "fire",
            "level": 3,
            "condition": null
        },
        {
            "kind": "element",
            "element": "water",
            "level": 3,
            "condition": "covered in mud"
        },
        [...]
    ],
    "rewards": [
        {
            "id": 22,
            "item": {
                "id": 148,
                "rarity": 4,
                "carryLimit": 99,
                "value": 300,
                "name": "Monster Bone M",
                "description": "Bone obtained from [...]"
            },
            "conditions": [
                {
                    "kind": "reward",
                    "rank": "low",
                    "quantity": 1,
                    "chance": 13,
                    "subtype": null
                }
            ]
        },
        [...]
    ]
}
```

This endpoint retrieves a monster by its ID.

### HTTP Request
`GET {{URL}}/{locale}/monsters/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The monster's ID|