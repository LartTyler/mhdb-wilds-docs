[Weapon]: #weapons

# Weapons
A [union type](#union-types), identified by the `kind` field.

|Property|Type|Description|
|---|---|---|
|id|Integer|The weapon's ID|
|kind|Discriminant<[WeaponKind](#weaponkind)>|The discriminant for the [tagged union](#union-types)|
|name|String|The weapon's name|
|rarity|Integer|The weapon's rarity|
|damageKind|[DamageKind](#damagekind)|The type of damage the weapon deals|
|damage|[WeaponDamage](#weapondamage)|An object describing the damage the weapon deals|
|specials|Array<[WeaponSpecial](#weaponspecial)>|An array of objects describing element or status damage dealt by the weapon|
|sharpness|Array<[Sharpness](#sharpness)>|An array of sharpness data at each level of handicraft; index 0 is base sharpness with no levels of handicraft applied|
|skills|Array<[Skill](#skills)>|An array of skills granted by the weapon|
|defenseBonus|Integer|Additional defense granted by the weapon|
|elderseal|[Elderseal](#elderseal)|The elderseal strength of the weapon; `null` indicates the weapon does not apply elderseal|
|affinity|Percent|The base affinity (critical hit chance) of the weapon|
|slots|Array<[DecorationSlot](#decorationslot)>|An array of decoration slots on the weapon|
|crafting|[WeaponCrafting](#weaponcrafting)|Crafting information for the weapon|

### WeaponDamage
|Property|Type|Description|
|---|---|---|
|raw|Integer|The raw (true) damage value|
|display|Integer|The damage value displayed in-game|

### WeaponSpecial
A [union type](#union-types), identified by the `kind` field.

|Property|Type|Description|
|---|---|---|
|id|Integer|The ID|
|damage|[WeaponDamage](#weapondamage)|An object describing the damage dealt by the special attribute|
|hidden|Boolean|Indicates that this special must be activated by the Free Element/Ammo Up skill|
|kind|Discriminant<[SpecialKind](#specialkind)>|The discriminant for the [tagged union](#union-types)|

### SpecialKind
The discriminant for the [WeaponSpecial](#weaponspecial) [tagged union](#union-types).

|Value|Subtype|
|---|---|
|element|[WeaponElement](#weaponelement)|
|status|[WeaponStatus](#weaponstatus)|

### WeaponElement
|Property|Type|Description|
|---|---|---|
|element|[Element](#element)|The element dealt by the special attribute|

### WeaponStatus
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

### WeaponKind
The discriminant for the [Weapon](#weapons) [tagged union](#union-types). Note that not all variants have additional fields; in
such cases, no subtype will be listed in the table below.

|Value|Subtype|
|---|---|
|bow|[Bow](#bow)|
|chage-blade|[ChargeBlade](#chargeblade)|
|dual-blades|—|
|great-sword|—|
|gunlance|[Gunlance](#gunlance)|
|hammer|—|
|heavy-bowgun|[HeavyBowgun](#heavybowgun)|
|hunting-horn|[HuntingHorn](#huntinghorn)|
|insect-glaive|—|
|lance|—|
|light-bowgun|[LightBowgun](#lightbowgun)|
|long-sword|—|
|switch-axe|—|
|sword-shield|—|

### Bow
|Property|Type|Description|
|---|---|---|
|coatings|Array<[BowCoating](#bowcoating)>|An array of coatings supported by the weapon|

### BowCoating
An enumerated value, one of the following:

||||
|-|-|-|
|close-range|power|paralysis|
|poison|sleep|blast|

### ChargeBlade
|Property|Type|Description|
|---|---|---|
|phial|[ChargeBladePhial](#chargebladephial)|The type of phial used by the weapon|

### ChargeBladePhial
An enumerated value, one of the following:

|||
|-|-|
|element|impact|

### Gunlance
|Property|Type|Description|
|---|---|---|
|shell|[GunlanceShell](#gunlanceshell)|The type of shell used by the weapon|
|shellLevel|Integer|The level of the weapon's shell|

### GunlanceShell
An enumerated value, one of the following:

||||
|-|-|-|
|normal|wide|long|

### HeavyBowgun
|Property|Type|Description|
|---|---|---|
|deviation|[Deviation](#deviation)|The weapon's deviation (accuracy)|
|specialAmmo|[BowgunSpecialAmmo](#bowgunspecialammo)|Special ammo available to the weapon|
|ammo|Array<[Ammo](#ammo)>|An array of ammo and capacities for the weapon; ammo the weapon cannot use will not be included in the array|
|autoReload|Array<[AutoReload](#autoreload)>|An array of objects indicating which ammo types support auto-reloading|

### Deviation
An enumerated value, one of the following:

||||
|-|-|-|
|none|low|average|
|high|||

### BowgunSpecialAmmo
An enumerated value, one of the following:

|||
|-|-|
|wyvernheart|wyvernsnipe|

### Ammo
|Property|Type|Description|
|kind|[AmmoKind](#ammokind)|The ammo type|
|capacities|Array&ltInteger>|An array of ammo capacity at different ammo levels; index zero is level one|

### AmmoKind
An enumerated value, one of the following:

||||||
|-|-|-|-|-|
|normal|piercing|spread|sticky|cluster|
|recover|poison|paralysis|sleep|exhaust|
|flaming|water|freeze|thunder|dragon|
|slicing|wyvern|demo|armor|tranq|

### AutoReload
|Property|Type|Description|
|---|---|---|
|ammo|[AmmoKind](#ammokind)|The ammo type|
|level|Integer|The level at which the ammo supports auto-reloading|

### HuntingHorn
|Property|Type|Description|
|---|---|---|
|melody|[HuntingHornMelody](#huntinghornmelody)|The weapon's note and melody information|

### HuntingHornMelody
|Property|Type|Description|
|---|---|---|
|id|Integer|The ID|
|notes|Array<[HuntingHornNote](#huntinghornnote)>|An array of notes used in the melody|
|songs|Array<[HuntingHornSong](#huntinghornsong)>|An array of songs that can be played by the weapon|

### HuntingHornNote
An enumerated value, one of the following:

|||||
|-|-|-|-|
|red|purple|blue|white|
|yellow|green|aqua|

### HuntingHornSong
|Property|Type|Description|
|---|---|---|
|sequence|Array&ltInteger>|An array of note indexes from the melody that make up the song, in the order they must be played|
|duration|Integer|The number of seconds that the song lasts|
|effects|String|A description of the effects granted by the song|
|personal|Boolean|Indicates if the song applies only to the player; `false` indicates that it affects all nearby hunters|

### LightBowgun
|Property|Type|Description|
|---|---|---|
|deviation|[Deviation](#deviation)|The weapon's deviation (accuracy)|
|ammo|Array<[Ammo](#ammo)>|An array of ammo and capacities for the weapon; ammo the weapon cannot use will not be included in the array|
|autoReload|Array<[AutoReload](#autoreload)>|An array of objects indicating which ammo types support auto-reloading|
|rapidFire|Array<[RapidFire](#rapidfire)>|An array of objects indicating which ammo types support rapid fire|

### RapidFire
|Property|Type|Description|
|---|---|---|
|kind|[AmmoKind](#ammokind)|The type of ammo|
|level|Integer|The level at which the ammo supports rapid fire|

## List all weapons
```shell
curl "{{URL}}/en/weapons"
```

> Returns an array of [Weapon] objects.

```json
[
    {
        "id": 1,
        "kind": "great-sword",
        "rarity": 1,
        "damage": {
            "display": 384,
            "raw": 80
        },
        "elderseal": null,
        "damageKind": "sever",
        "name": "Buster Sword 1",
        "sharpness": [
            {
                "red": 100,
                "orange": 50,
                "yellow": 50,
                "green": 0,
                "blue": 0,
                "white": 0,
                "purple": 0
            },
            [...]
        ],
        "skills": [],
        "defenseBonus": 0,
        "affinity": 0,
        "slots": [],
        "elements": [],
        "crafting": {
            "craftable": true,
            "previous": null,
            "branches": [
                {
                    "id": 2,
                    "name": "Buster Sword 2"
                }
            ],
            "craftingZennyCost": 100,
            "craftingMaterials": [...],
            "upgradeZennyCost": 0,
            "upgradeMaterials": []
        }
    }
]
```

This is a list endpoint, and supports [filtering](#filterin-objects-in-the-response).

### HTTP Request
`GET {{URL}}/{locale}/weapons`

## List all weapons by type
```shell
curl -G "{{URL}}/en/weapons" --data-urlencode 'q={"kind": "great-sword"}'
```

> Returns an array of [Weapon] objects that are all Great Swords.

```json
[
    {
        "id": 1,
        "kind": "great-sword",
        "rarity": 1,
        "damage": {
            "display": 384,
            "raw": 80
        },
        "elderseal": null,
        "damageKind": "sever",
        "name": "Buster Sword 1",
        "sharpness": [
            {
                "red": 100,
                "orange": 50,
                "yellow": 50,
                "green": 0,
                "blue": 0,
                "white": 0,
                "purple": 0
            },
            [...]
        ],
        "skills": [],
        "defenseBonus": 0,
        "affinity": 0,
        "slots": [],
        "elements": [],
        "crafting": {
            "craftable": true,
            "previous": null,
            "branches": [
                {
                    "id": 2,
                    "name": "Buster Sword 2"
                }
            ],
            "craftingZennyCost": 100,
            "craftingMaterials": [...],
            "upgradeZennyCost": 0,
            "upgradeMaterials": []
        }
    }
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

### HTTP Request
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
    "id": 1,
    "kind": "great-sword",
    "rarity": 1,
    "damage": {
        "display": 384,
        "raw": 80
    },
    "elderseal": null,
    "damageKind": "sever",
    "name": "Buster Sword 1",
    "sharpness": [
        {
            "red": 100,
            "orange": 50,
            "yellow": 50,
            "green": 0,
            "blue": 0,
            "white": 0,
            "purple": 0
        },
        [...]
    ],
    "skills": [],
    "defenseBonus": 0,
    "affinity": 0,
    "slots": [],
    "elements": [],
    "crafting": {
        "craftable": true,
        "previous": null,
        "branches": [
            {
                "id": 2,
                "name": "Buster Sword 2"
            }
        ],
        "craftingZennyCost": 100,
        "craftingMaterials": [...],
        "upgradeZennyCost": 0,
        "upgradeMaterials": []
    }
}
```

Retrieves a single weapon by its ID.

### HTTP Request
`GET {{URL}}/{locale}/weapons/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The weapon's ID|