[Weapon]: #weapons

# Weapons
## Properties
```json
{
    "gameId": 26,
    "crafting": {
        "weapon": {
            "id": 100
        },
        "craftable": false,
        "previous": {
            "name": "Uth Valeroje II",
            "id": 99
        },
        "branches": [
            {
                "name": "Valeroje-of-the-Waves",
                "id": 101
            }
        ],
        "craftingMaterials": [],
        "craftingZennyCost": 0,
        "upgradeMaterials": [
            {
                "item": {
                    "id": 291,
                    "gameId": 327,
                    "rarity": 5,
                    "name": "Uth Duna Plate",
                    "description": "A rare plate from an [...]",
                    "value": 3600,
                    "carryLimit": 99,
                    "recipes": []
                },
                "quantity": 1,
                "id": 2580
            },
            [...]
        ],
        "upgradeZennyCost": 14000,
        "id": 100
    },
    "rarity": 7,
    "kind": "charge-blade",
    "damage": {
        "raw": 220,
        "display": 792
    },
    "specials": [
        {
            "element": "water",
            "kind": "element",
            "damage": {
                "raw": 32,
                "display": 320
            },
            "hidden": false,
            "id": 50
        }
    ],
    "name": "Uth Valeroje III",
    "description": "An Uth Duna charge blade. A lovely [...]",
    "defenseBonus": 0,
    "elderseal": null,
    "slots": [
        3,
        2
    ],
    "affinity": -15,
    "skills": [
        {
            "skill": {
                "id": 97,
                "name": "Power Prolonger",
                "description": "Allows long swords, dual [...]"
            },
            "level": 3,
            "description": "Greatly boosts the duration weapons are powered up.",
            "id": 251
        }
    ],
    "id": 100,
}
```
> An example `Weapon` object. Some fields have been truncated or removed to show only fields present on _all_ weapons.

A [union type](#union-types), identified by the `kind` field.

|Property|Type|Description|
|---|---|---|
|id|Integer|The weapon's ID|
|gameId|[GameId](#gameid)|The ID used by the game files to identify the weapon; unique only for weapons with the same [`kind`](#weaponkind)|
|kind|Discriminant<[WeaponKind](#weapon-types)>|The discriminant for the [tagged union](#union-types)|
|name|String|The weapon's name|
|rarity|Integer|The weapon's rarity|
|damage|[WeaponDamage](#weapondamage)|An object describing the damage the weapon deals|
|specials|Array<[WeaponSpecial](#weaponspecial)>|An array of objects describing element or status damage dealt by the weapon|
|sharpness|[Sharpness](#sharpness)|The base sharpness of the weapon; **not present on bows or bowguns**|
|handicraft|Array&lt;Integer>|An array of breakpoints for the Handicraft skill; see [Handicraft](#handicraft) for more information (not present on bows or bowguns)|
|skills|Array<[SkillRanks](#skillranks)>|An array of skills granted by the weapon|
|defenseBonus|Integer|Additional defense granted by the weapon|
|elderseal|[Elderseal](#elderseal)|The elderseal strength of the weapon; `null` indicates the weapon does not apply elderseal|
|affinity|Percent|The base affinity of the weapon; can be negative|
|slots|Array<[DecorationSlot](#decorationslot)>|An array of decoration slots on the weapon|
|crafting|[WeaponCrafting](#weaponcrafting)|Crafting information for the weapon|

#### WeaponDamage
|Property|Type|Description|
|---|---|---|
|raw|Integer|The raw (true) damage value|
|display|Integer|The damage value displayed in-game|

#### WeaponSpecial
A [union type](#union-types), identified by the `kind` field.

|Property|Type|Description|
|---|---|---|
|id|Integer|The ID|
|damage|[WeaponDamage](#weapondamage)|An object describing the damage dealt by the special attribute|
|hidden|Boolean|Indicates that this special must be activated by the Free Element/Ammo Up skill|
|kind|Discriminant<[SpecialKind](#specialkind)>|The discriminant for the [tagged union](#union-types)|

#### SpecialKind
The discriminant for the [WeaponSpecial](#weaponspecial) [tagged union](#union-types).

|Value|Subtype|
|---|---|
|element|[WeaponElement](#weaponelement)|
|status|[WeaponStatus](#weaponstatus)|

#### WeaponElement
|Property|Type|Description|
|---|---|---|
|element|[Element](#element)|The element dealt by the special attribute|

#### WeaponStatus
|Property|Type|Description|
|---|---|---|
|status|[Status](#status)|The status effect dealt by the special attribte|

### Sharpness
Weapon sharpness is represented by the number of normal hits a weapon can make before that segment is depleted. For
example, a weapon with 50 blue sharpness can hit a monster 50 times before dropping into the green bar segment, assuming
none of those 50 hits bounced.

|Property|Type|Description|
|---|---|---|
|red|Integer|The durability of the red (first) bar segment|
|orange|Integer|The durability of the orange (second) bar segment|
|yellow|Integer|The durability of the yellow (third) bar segment|
|green|Integer|The durability of the gree (fourth) bar segment|
|blue|Integer|The durability of the blue (fifth) bar segment|
|white|Integer|The durability of the white (sixth) bar segment|
|purple|Integer|The durability of the purple (seventh) bar segment|

Weapon sharpness cannot have a cumulative value of over 400 across all segments. This means that sharpness values from
the API can be easily converted into a display representation similar to the in-game sharpness bar by dividing the
sharpness value by 400 and multiplying that by the width of your sharpness bar, then flooring the result. Given a bar
with a width of 100 pixels, your formula would look something like this:

`barPixels = ⌊sharpness / 400 * 100⌋`

|Color|Value|Formula|Result|
|---|---|---|---|
|Red|110|`⌊110 / 400 * 100⌋`|27px|
|Orange|30|`⌊30 / 400 * 100⌋`|7px|
|Yellow|60|`⌊60 / 400 * 100⌋`|15px|
|Green|80|`⌊80 / 400 * 100⌋`|20px|
|Blue|40|`⌊40 / 400 * 100⌋`|10px|
|White|30|`⌊30 / 400 * 100⌋`|7px|
|Purple|0|`⌊0 / 400 * 100⌋`|0px|

In the above example, the resulting bar might look something like the one below.

<div class="sharpness-bar">
    <div class="red" style="width: 27px"></div>
    <div class="orange" style="width: 7px"></div>
    <div class="yellow" style="width: 15px"></div>
    <div class="green" style="width: 20px"></div>
    <div class="blue" style="width: 10px"></div>
    <div class="white" style="width: 7px"></div>
</div>

### Handicraft
Each level of the Handicraft skill adds 10 hits to the weapon's sharpness. In some cases, hitting a certain level of
Handicraft on a specific weapon will cause sharpness of the next color up to be added to instead. The API encodes this
as an array where each element is the number of Handicraft levels before the weapon moves to the next sharpness color.
The first element in the array indicates the number of levels that apply to the weapon's highest base sharpness
segment, and each subsequent element in the array applies to segments after that.

For example, the charge blade "Valeroje-of-the-Waves" has a `handicraft` of `[1, 4]`, and a base blue sharpness of 50.
Adding one level of Handicraft would increase the blue sharpness to 60, and a second level of Handicraft would add 10
hits of white sharpness. A third would add another 10 to the white sharpness bar, and so on until a total of 40 white
sharpness at Handicraft 5.

### WeaponCrafting
|Property|Type|Description|
|---|---|---|
|id|Integer|The ID|
|craftable|Boolean|Indicates if the weapon can be directly crafted; `false` indicates that the weapon must be upgraded from the previous weapon|
|previous|[Weapon]|The previous weapon in the crafting tree, or `null` if there isn't one|
|branches|Array<[Weapon]>|An array of weapons that the weapon can be upgraded into|
|craftingZennyCost|Integer|The amount of zenny required to craft the weapon|
|craftingMaterials|Array<[CraftingCost](#craftingcost)>|An array of materials required to craft the weapon|
|upgradeZennyCost|Integer|The amount of zenny required to upgrade the previous weapon into this one|
|upgradeMaterials|Array<[CraftingCost](#craftingcost)>|An array of materials required to upgrade the previous weapon into this one|

## Weapon Types
The discriminant for the [Weapon](#weapons) [tagged union](#union-types). Note that not all variants have additional fields; in
such cases, no subtype will be listed in the table below.

|Value|Subtype|<div style="display: inline-block; width: 40px;"></div>|Value|Subtype|
|---|---|-|---|---|
|bow|[Bow](#bow)||hunting-horn|[Hunting Horn](#hunting-horn)|
|charge-blade|[Charge Blade](#charge-blade)||insect-glaive|[Insect Glaive](#insect-glaive)|
|dual-blades|—||lance|—|
|great-sword|—||light-bowgun|[Light Bowgun](#light-bowgun)|
|gunlance|[Gunlance](#gunlance)||long-sword|—|
|hammer|—||switch-axe|[Switch Axe](#switch-axe)|
|heavy-bowgun|[Heavy Bowgun](#heavy-bowgun)||sword-shield|—|

### Bow
```json
{
    "coatings": [
        "power",
        "paralysis"
    ]
}
```
> An example `Bow` object. Fields have been omitted to show only those added to `Bow` objects.

|Property|Type|Description|
|---|---|---|
|coatings|Array<[BowCoating](#bowcoating)>|An array of coatings supported by the weapon|

#### BowCoating
An enumerated value, one of the following:

|||||
|-|-|-|-|
|close-range|power|pierce|paralysis|
|poison|sleep|blast|exhaust|

### Charge Blade
```json
{
    "phial": "impact",
    "sharpness": {
        "red": 50,
        "orange": 60,
        "yellow": 40,
        "green": 50,
        "blue": 0,
        "white": 0,
        "purple": 0
    },
    "handicraft": [
        5
    ]
}
```
> An example `ChargeBlade` object. Fields have been omitted to show only those added to `ChargeBlade` objects.

|Property|Type|Description|
|---|---|---|
|phial|[ChargeBladePhial](#chargebladephial)|The type of phial used by the weapon|

#### ChargeBladePhial
An enumerated value, one of the following:

|||
|-|-|
|element|impact|

### Gunlance
```json
{
    "shell": "normal",
    "shellLevel": 2,
    "sharpness": {
        "red": 50,
        "orange": 50,
        "yellow": 40,
        "green": 60,
        "blue": 0,
        "white": 0,
        "purple": 0
    },
    "handicraft": [
        5
    ]
}
```
> An example `Gunlance` object. Fields have been omitted to show only those added to `Gunlance` objects.

|Property|Type|Description|
|---|---|---|
|shell|[GunlanceShell](#gunlanceshell)|The type of shell used by the weapon|
|shellLevel|Integer|The level of the weapon's shell|

#### GunlanceShell
An enumerated value, one of the following:

||||
|-|-|-|
|normal|wide|long|

### Heavy Bowgun
```json
{
    "ammo": [
        {
            "kind": "normal",
            "level": 2,
            "capacity": 4,
            "id": 1
        },
        {
            "kind": "pierce",
            "level": 1,
            "capacity": 5,
            "id": 2
        },
        {
            "kind": "spread",
            "level": 1,
            "capacity": 4,
            "id": 3
        },
        [...]
    ]
}
```
> An example `HeavyBowgun` object. Fields have been omitted to show only those added to `Gunlance` objects. Additionally,
> some fields have been truncated to preserve readability.

|Property|Type|Description|
|---|---|---|
|ammo|Array<[HeavyBowgunAmmo](#heavybowgunammo)>|An array of ammo and capacities for the weapon; ammo the weapon cannot use will not be included in the array|

#### HeavyBowgunAmmo
|Property|Type|Description|
|---|---|---|
|kind|[AmmoKind](#ammokind)|The ammo type|
|level|Integer|The ammo level|
|capacity|Integer|The number of shots before reloading|

### Hunting Horn
```json
{
    "melody": {
        "id": 5,
        "gameId": 4,
        "notes": [
            "white",
            "red",
            "yellow"
        ],
        "songs": [
            {
                "effectId": 1,
                "sequence": [
                    "white",
                    "white"
                ],
                "name": "Self-Improvement",
                "id": 2
            },
            {
                "effectId": 11,
                "sequence": [
                    "white",
                    "red",
                    "white"
                ],
                "name": "Attack Up (S)",
                "id": 18
            },
            [...]
        ]
    },
    "echoBubble": {
        "kind": "evasion",
        "name": "Evasion & Movement Speed Up",
        "id": 1,
        "gameId": 1
    },
    "echoWave": {
        "id": 1,
        "gameId": 1,
        "kind": "blunt",
        "name": "Echo Wave (Blunt)"
    },
    "sharpness": {
        "red": 50,
        "orange": 60,
        "yellow": 50,
        "green": 40,
        "blue": 0,
        "white": 0,
        "purple": 0
    },
    "handicraft": [
        5
    ]
}
```
> An example `HuntingHorn` object. Fields have been omitted to show only those added to `HuntingHorn` objects.
> Additionally, some fields have been truncated to preserve readability.

|Property|Type|Description|
|---|---|---|
|melody|[HuntingHornMelody](#huntinghornmelody)|The weapon's note and melody information|
|echoBubble|[HuntingHornBubble](#huntinghornbubble)|The echo bubble used by the hunting horn|
|echoWave|[HuntingHornWave](#huntinghornwave)|The echo wave used by the hunting horn; some horns do not have an echo wave|

#### HuntingHornMelody
|Property|Type|Description|
|---|---|---|
|id|Integer|The ID|
|gameId|[GameId](#gameid)|The ID used by the game files to identify the melody (note set)|
|notes|Array<[HuntingHornNote](#huntinghornnote)>|An array of notes used in the melody|
|songs|Array<[HuntingHornSong](#huntinghornsong)>|An array of songs that can be played by the weapon|

#### HuntingHornNote
An enumerated value, one of the following:

|||||
|-|-|-|-|
|purple|red|orange|yellow|
|green|blue|aqua|white|

#### HuntingHornSong
|Property|Type|Description|
|---|---|---|
|id|Integer|The ID|
|effectId|Integer|An identifier for the effect granted by the song; all songs that grant the same effect will share the same `effectId`|
|sequence|Array<[HuntingHornNote](#huntinghornnote)>|An array of notes that make up the song, in the order they must be played|
|name|String|The name of the song, e.g. "Attack Up (S)"|

Note that `effectId` is _not_ a unique identifier. Some songs can be played with different note combinations, and the
API encodes that as multiple entries in the database for each note combination that share the same `effectId`.

#### HuntingHornBubble
|Property|Type|Description|
|---|---|---|
|id|Integer|The ID|
|gameId|[GameId](#gameid)|The ID used by the game files to identify the echo bubble|
|kind|[HuntingHornBubbleKind](#huntinghornbubblekind)|The type of effect granted by the echo bubble|
|name|String|The name of the echo bubble effect|

#### HuntingHornBubbleKind
An enumerated value, one of the following:

|Value|In-Game Name (English)|<div style="display: inline-block; width: 40px;"></div>|Value|In-Game Name (English)|
|---|---|-|---|---|
|evasion|Evasion & Movement Speed Up||damage|Attack & Affinity Up|
|regen|Health Regeneration||defense|Defense & Elemental Res Up|
|stamina|Stamina Regeneration||immunity|Ailments/Blights Negated|

#### HuntingHornWave
|Property|Type|Description|
|---|---|---|
|id|Integer|The ID|
|gameId|[GameId](#gameid)|The ID used by the game files to identify the echo wave|
|kind|[HuntingHornWaveKind](#huntinghornwavekind)|The type of effect granted by the echo wave|
|name|String|The name of the echo wave effect|

#### HuntingHornWaveKind
An enumerated value, one of the following:

|||||
|-|-|-|-|
|blunt|slash|fire|water|
|thunder|ice|dragon|poison|
|paralyze|sleep|blast||

### Insect Glaive
```json
{
    "kinsectLevel": 1,
    "sharpness": {
        "red": 50,
        "orange": 50,
        "yellow": 40,
        "green": 60,
        "blue": 0,
        "white": 0,
        "purple": 0
    },
    "handicraft": [
        5
    ]
}
```
> An example `InsectGlaive` object. Fields have been omitted to show only those added to `InsectGlaive` objects.

|Property|Type|Description|
|---|---|---|
|kinsectLevel|Integer|The kinsect level modifier for the weapon|

### Light Bowgun
```json
{
    "ammo": [
        {
            "kind": "normal",
            "level": 2,
            "capacity": 4,
            "rapid": true,
            "id": 1
        },
        {
            "kind": "pierce",
            "level": 1,
            "capacity": 4,
            "rapid": false,
            "id": 2
        },
        [...]
    ],
    "specialAmmo": "wyvernblast",
}
```
> An example `LightBowgun` object. Fields have been omitted to show only those added to `LightBowgun` objects.
> Additionally, some fields have been truncated to preserve readability.

|Property|Type|Description|
|---|---|---|
|ammo|Array<[LightBowgunAmmo](#lightbowgunammo)>|An array of ammo and capacities for the weapon; ammo the weapon cannot use will not be included in the array|
|specialAmmo|[LightBowgunSpecialAmmo](#lightbowgunspecialammo)|Indicates the type of special ammo available to the weapon|

#### LightBowgunAmmo
|Property|Type|Description|
|---|---|---|
|kind|[AmmoKind](#ammokind)|The ammo type|
|level|Integer|The ammo level|
|capacity|Integer|The number of shots before reloading|
|rapid|Boolean|Indicates if the ammo has the "Rapid Fire" modifier|

#### LightBowgunSpecialAmmo
An enumerated value, one of the following:

|||
|-|-|
|wyvernblast|adhesive|

### Switch Axe
```json
{
    "phial": {
        "kind": "dragon",
        "damage": {
            "raw": 12,
            "display": 120
        }
    },
    "sharpness": {
        "red": 80,
        "orange": 40,
        "yellow": 60,
        "green": 80,
        "blue": 70,
        "white": 20,
        "purple": 0
    },
    "handicraft": [
        5
    ]
}
```
> An example `SwitchAxe` object. Fields have been omitted to show only those added to `SwitchAxe` objects.

|Property|Type|Description|
|---|---|---|
|phial|[Phial](#phial)|The phial used by the weapon|

Note that, while the field name in the API is `phial`, due to database limitations the field is actually named
`switchAxePhial` (otherwise it would conflict with the charge blade's `phial` field). This is only relevant if you try
to [query for the field](#searching-the-api); if you do, you will need to use the `switchAxePhial` field name instead of
the one in the API response.

#### Phial
|Property|Type|Description|
|---|---|---|
|kind|[SwitchAxePhial](#switchaxephial)|The phial's type|
|damage|[WeaponDamage](#weapondamage)|The damage dealt by the phial; **not present for `power` and `element` types**|

#### SwitchAxePhial
An enumerated value, one of the following:

||||
|-|-|-|
|power|element|dragon|
|exhaust|paralyze|poison|

## List all weapons
```shell
curl "{{URL}}/en/weapons"
```

> Returns an array of [Weapon] objects.

```json
[
    {
        "gameId": 2,
        "crafting": {
            "weapon": {
                "id": 148
            },
            "craftable": false,
            "previous": {
                "name": "Hope Daggers I",
                "id": 147
            },
            "branches": [
                {
                    "name": "Hope Daggers III",
                    "id": 149
                }
            ],
            "craftingMaterials": [],
            "craftingZennyCost": 0,
            "upgradeMaterials": [
                {
                    "item": {
                        "id": 51,
                        "gameId": 53,
                        "rarity": 4,
                        "name": "Iron Ore",
                        "description": "Ore that can be smelted into a multi-purpose metal.",
                        "value": 60,
                        "carryLimit": 10,
                        "recipes": []
                    },
                    "quantity": 2,
                    "id": 2745
                }
            ],
            "upgradeZennyCost": 500,
            "id": 148
        },
        "rarity": 1,
        "kind": "dual-blades",
        "damage": {
            "raw": 100,
            "display": 140
        },
        "specials": [],
        "name": "Hope Daggers II",
        "description": "Dual blades made specifically for [...]",
        "defenseBonus": 0,
        "elderseal": null,
        "slots": [],
        "affinity": 0,
        "skills": [
            {
                "skill": {
                    "id": 119,
                    "name": "Speed Sharpening",
                    "description": "Speeds up weapon sharpening when using a whetstone."
                },
                "level": 1,
                "description": "Removes one cycle from the sharpening process.",
                "id": 318
            }
        ],
        "id": 148,
        "sharpness": {
            "red": 40,
            "orange": 40,
            "yellow": 40,
            "green": 80,
            "blue": 0,
            "white": 0,
            "purple": 0
        },
        "handicraft": [
            5
        ]
    },
    [...]
]
```

This is a list endpoint, and supports [filtering](#filterin-objects-in-the-response).

##### HTTP Request
`GET {{URL}}/{locale}/weapons`

## List all weapons by type
```shell
curl -G "{{URL}}/en/weapons" --data-urlencode 'q={"kind": "dual-blades"}'
```

> Returns an array of [Weapon] objects that are all Great Swords.

```json
[
    {
        "gameId": 2,
        "crafting": {
            "weapon": {
                "id": 148
            },
            "craftable": false,
            "previous": {
                "name": "Hope Daggers I",
                "id": 147
            },
            "branches": [
                {
                    "name": "Hope Daggers III",
                    "id": 149
                }
            ],
            "craftingMaterials": [],
            "craftingZennyCost": 0,
            "upgradeMaterials": [
                {
                    "item": {
                        "id": 51,
                        "gameId": 53,
                        "rarity": 4,
                        "name": "Iron Ore",
                        "description": "Ore that can be smelted into a multi-purpose metal.",
                        "value": 60,
                        "carryLimit": 10,
                        "recipes": []
                    },
                    "quantity": 2,
                    "id": 2745
                }
            ],
            "upgradeZennyCost": 500,
            "id": 148
        },
        "rarity": 1,
        "kind": "dual-blades",
        "damage": {
            "raw": 100,
            "display": 140
        },
        "specials": [],
        "name": "Hope Daggers II",
        "description": "Dual blades made specifically for [...]",
        "defenseBonus": 0,
        "elderseal": null,
        "slots": [],
        "affinity": 0,
        "skills": [
            {
                "skill": {
                    "id": 119,
                    "name": "Speed Sharpening",
                    "description": "Speeds up weapon sharpening when using a whetstone."
                },
                "level": 1,
                "description": "Removes one cycle from the sharpening process.",
                "id": 318
            }
        ],
        "id": 148,
        "sharpness": {
            "red": 40,
            "orange": 40,
            "yellow": 40,
            "green": 80,
            "blue": 0,
            "white": 0,
            "purple": 0
        },
        "handicraft": [
            5
        ]
    },
    [...]
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

##### HTTP Request
`GET {{URL}}/{locale}/weapons?q={"kind": "{kind}"}`

|Parameter|Type|Description|
|---|---|---|
|kind|[WeaponKind](#weaponkind)|The type of weapon to retrieve|

## Retrieve a weapon
```shell
curl "{{URL}}/en/weapons/1"
```

> Returns a single [Weapon] object.


```json
{
    "gameId": 2,
    "crafting": {
        "weapon": {
            "id": 148
        },
        "craftable": false,
        "previous": {
            "name": "Hope Daggers I",
            "id": 147
        },
        "branches": [
            {
                "name": "Hope Daggers III",
                "id": 149
            }
        ],
        "craftingMaterials": [],
        "craftingZennyCost": 0,
        "upgradeMaterials": [
            {
                "item": {
                    "id": 51,
                    "gameId": 53,
                    "rarity": 4,
                    "name": "Iron Ore",
                    "description": "Ore that can be smelted into a multi-purpose metal.",
                    "value": 60,
                    "carryLimit": 10,
                    "recipes": []
                },
                "quantity": 2,
                "id": 2745
            }
        ],
        "upgradeZennyCost": 500,
        "id": 148
    },
    "rarity": 1,
    "kind": "dual-blades",
    "damage": {
        "raw": 100,
        "display": 140
    },
    "specials": [],
    "name": "Hope Daggers II",
    "description": "Dual blades made specifically for [...]",
    "defenseBonus": 0,
    "elderseal": null,
    "slots": [],
    "affinity": 0,
    "skills": [
        {
            "skill": {
                "id": 119,
                "name": "Speed Sharpening",
                "description": "Speeds up weapon sharpening when using a whetstone."
            },
            "level": 1,
            "description": "Removes one cycle from the sharpening process.",
            "id": 318
        }
    ],
    "id": 148,
    "sharpness": {
        "red": 40,
        "orange": 40,
        "yellow": 40,
        "green": 80,
        "blue": 0,
        "white": 0,
        "purple": 0
    },
    "handicraft": [
        5
    ]
}
```

Retrieves a single weapon by its ID.

##### HTTP Request
`GET {{URL}}/{locale}/weapons/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The weapon's ID|