[Monster]: #monsters

# Monsters
## Properties
|Property|Type|Description|
|---|---|---|
|id|Integer|The monster's ID|
|gameId|[GameId](#gameid)|The ID used by the game files to identify the monster|
|kind|Enum<[MonsterKind](#monsterkind)>|The monster's category|
|species|Enum<[Species](#species)>|The monster's species|
|name|String|The monster's name|
|size|[MonsterSize](#monstersize)|The monster's base size and crown size breakpoints|
|description|String|The monster's description|
|features|String|The "features" section from the monster guide|
|tips|String|The "tips" section from the monster guide|
|baseHealth|Integer|The monster's base health|
|locations|Array<[Location](#locations)>|The locations in which the monster can be found|
|resistances|Array<[MonsterResistance](#monsterresistance)>|The monster's elemental and status resistances|
|weaknesses|Array<[MonsterWeakness](#monsterweakness)>|The monster's elemental and status weaknesses|
|rewards|Array<[MonsterReward](#monsterreward)>|Items can be obtained from fighting the monster|
|breakableParts|Array<[MonsterPart](#monsterpart)>|Monster parts that can be broken; corresponds to `broken-part` entries in `rewards`|

### MonsterKind
An enumerated value, one of:

|||
|-|-|
|small|large|

### Species
An enumerated value, one of:

|||||
|-|-|-|-|
|flying-wyvern|fish|herbivore|lynian|
|neopteron|carapaceon|fanged-beast|bird-wyvern|
|piscine-wyvern|leviathan|brute-wyvern|fanged-wyvern|
|amphibian|temnoceran|snake-wyvern|elder-dragon|
|cephalopod|construct|wingdrake|demi-elder|

### MonsterSize
|Property|Type|Description|
|---|---|---|
|base|Float|The monster's base size|
|mini|Float|The size the monster must be below to qualify as a mini crown|
|silver|Float|The size the monster must be above to qualify as a silver crown|
|gold|Float|The size the monster must be above to qualify as a gold crown|

### MonsterResistance
A union type, identified by the `kind` field.

|Property|Type|Description|
|---|---|---|
|id|Integer|The resistance's ID|
|condition|String|The condition or status of the monster during which this resistance is active; a `null` value indicates the resistance is always active|
|kind|Discriminant<[ResistanceKind](#resistancekind)>|The discriminant for the [tagged union](#union-types)|

#### ResistanceKind
The discriminant for the [MonsterResistance](#monsterresistance) [tagged union](#union-types).

|Value|Subtype|
|---|---|
|element|[ElementResistance](#elementresistance)|
|status|[StatusResistance](#statusresistance)|
|effect|[EffectResistance](#effectresistance)|

#### ElementResistance
|Property|Type|Description|
|---|---|---|
|element|[Element](#element)|The element the monster is resistant to|

#### StatusResistance
|Property|Type|Description|
|---|---|---|
|status|[Status](#status)|The status the monster is resistant to|

#### EffectResistance
|Property|Type|Description|
|effect|[Effect](#effect)|The effect the monster is resistant to|

### MonsterWeakness
A union type, identified by the `kind` field.

|Property|Type|Description|
|---|---|---|
|id|Integer|The weakness's ID|
|level|Integer|How powerful the weakness is; higher values indicate a more severe weakness|
|condition|String|The condition or status of the monster during which this weakness applies; a `null` value indicates that the weakness is always active|
|kind|Discriminant<[WeaknessKind](#weaknesskind)>|The discriminant for the [tagged union](#union-types)|

#### WeaknessKind
The discriminant for the [MonsterWeakness](#monsterweakness) [tagged union](#union-types).

|Value|Subtype|
|---|---|
|element|[ElementWeakness](#elementweakness)|
|status|[StatusWeakness](#statusweakness)|
|effect|[EffectWeakness](#effectweakness)|

#### ElementWeakness
|Property|Type|Description|
|---|---|---|
|element|[Element](#element)|The element the monster is weak to|

#### StatusWeakness
|Property|Type|Description|
|---|---|---|
|status|[Status](#status)|The status the monster is weak to|

#### EffectWeakness
|Property|Type|Description|
|---|---|---|
|effect|[Effect](#effect)|The effect the monster is weak to|

### MonsterReward
|Property|Type|Description|
|---|---|---|
|item|[Item](#items)|The item given by the reward|
|conditions|Array<[RewardCondition](#rewardcondition)>|An array of conditions required for the reward to be granted|

#### RewardCondition
|Property|Type|Description|
|---|---|---|
|kind|[RewardConditionKind](#rewardconditionkind)|The type of reward this is (such as a carve, wound, etc.)|
|rank|[Rank](#rank)|The hunter rank group for the reward|
|quantity|Integer|The base amount of the item that can be given by the reward|
|chance|Percent|How likely it is that the reward will be given|
|part|[Enum-like](#enum-like)|Only populated for `broken-part` rewards; if set, corresponds to an entry in [`Monster.breakableParts`](#monsters) indicating which part needs to be broken|

#### RewardConditionKind
An enumerated value, one of:

|||||
|-|-|-|-|
|carve|carve-severed|endemic-capture|target-reward|
|broken-part|wound-destroyed|carve-rotten|slinger-gather|
|carve-rotten-severed|tempered-wound-destroyed|carve-crystallized||

## List all monsters
```shell
curl "{{URL}}/en/monsters"
```

> Returns an array of [Monster] objects.

```json
[
    {
        "size": {
            "base": 2057.0854,
            "mini": 1851.3768,
            "silver": 2365.6482,
            "gold": 2530.215
        },
        "kind": "large",
        "species": "flying-wyvern",
        "name": "Rey Dau",
        "description": "The flying wyvern that reigns [...]",
        "locations": [
            {
                "name": "Windward Plains",
                "zoneCount": 17,
                "id": 22,
                "gameId": -1226157568
            }
        ],
        "resistances": [
            {
                "effect": "noise",
                "kind": "effect",
                "condition": null,
                "id": 44
            }
        ],
        "weaknesses": [
            {
                "element": "ice",
                "kind": "element",
                "level": 1,
                "condition": null,
                "id": 241
            },
            [...]
        ],
        "rewards": [
            {
                "item": {
                    "id": 117,
                    "gameId": 139,
                    "rarity": 4,
                    "name": "Rey Dau Scale",
                    "description": "A Rey Dau scale. Its unique shape allows [...]",
                    "value": 620,
                    "carryLimit": 99,
                    "recipes": []
                },
                "conditions": [
                    {
                        "kind": "target-reward",
                        "rank": "low",
                        "quantity": 1,
                        "chance": 25,
                        "part": null,
                        "id": 1616
                    },
                    [...]
                ],
                "id": 465
            },
            [...]
        ],
        "features": "The flying wyvern that reigns supreme over the [...]",
        "tips": "When a Rey Dau's wing or tail touches the ground while [...]",
        "baseHealth": 5000,
        "variants": [
            {
                "monster": {
                    "id": 3
                },
                "name": "Tempered Rey Dau",
                "kind": "tempered",
                "id": 2
            }
        ],
        "breakableParts": [
            {
                "monster": {
                    "id": 3
                },
                "part": "corner",
                "name": "Horn",
                "id": 97
            },
            [...]
        ],
        "id": 3,
        "gameId": -1547364608
    }
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

##### HTTP Request
`GET {{URL}}/{locale}/monsters`

## Retrieve a monster
```shell
curl "{{URL}}/en/monsters/20"
```

> Returns a single [Monster] object.

```json
{
    "size": {
        "base": 2057.0854,
        "mini": 1851.3768,
        "silver": 2365.6482,
        "gold": 2530.215
    },
    "kind": "large",
    "species": "flying-wyvern",
    "name": "Rey Dau",
    "description": "The flying wyvern that reigns [...]",
    "locations": [
        {
            "name": "Windward Plains",
            "zoneCount": 17,
            "id": 22,
            "gameId": -1226157568
        }
    ],
    "resistances": [
        {
            "effect": "noise",
            "kind": "effect",
            "condition": null,
            "id": 44
        }
    ],
    "weaknesses": [
        {
            "element": "ice",
            "kind": "element",
            "level": 1,
            "condition": null,
            "id": 241
        },
        [...]
    ],
    "rewards": [
        {
            "item": {
                "id": 117,
                "gameId": 139,
                "rarity": 4,
                "name": "Rey Dau Scale",
                "description": "A Rey Dau scale. Its unique shape allows [...]",
                "value": 620,
                "carryLimit": 99,
                "recipes": []
            },
            "conditions": [
                {
                    "kind": "target-reward",
                    "rank": "low",
                    "quantity": 1,
                    "chance": 25,
                    "part": null,
                    "id": 1616
                },
                [...]
            ],
            "id": 465
        },
        [...]
    ],
    "features": "The flying wyvern that reigns supreme over the [...]",
    "tips": "When a Rey Dau's wing or tail touches the ground while [...]",
    "baseHealth": 5000,
    "variants": [
        {
            "monster": {
                "id": 3
            },
            "name": "Tempered Rey Dau",
            "kind": "tempered",
            "id": 2
        }
    ],
    "breakableParts": [
        {
            "monster": {
                "id": 3
            },
            "part": "corner",
            "name": "Horn",
            "id": 97
        },
        [...]
    ],
    "id": 3,
    "gameId": -1547364608
}
```

This endpoint retrieves a monster by its ID.

##### HTTP Request
`GET {{URL}}/{locale}/monsters/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The monster's ID|