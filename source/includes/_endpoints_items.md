[Item]: #items

# Items
## Properties
|Property|Type|Description|
|---|---|---|
|id|Integer|The item's ID|
|gameId|[GameId](#gameid)|The ID used by the game files to identify the item|
|name|String|The item's name|
|description|String|The item's description|
|rarity|Integer|The item's rarity|
|carryLimit|Integer|The maximum number of the item that can be carried at once|
|value|Integer|The value of the item when sold to a vendor|
|recipes|Array<[ItemRecipe](#itemrecipe)>|An array of crafting recipes that produce the item|
|icon|[ItemIcon](#itemicon)|Icon information|

### ItemRecipe
|Property|Type|Description|
|---|---|---|
|id|Integer|The ID of the recipe|
|amount|Integer|The number of items produced by the recipe|
|inputs|Array<[Item](#items)>|An array of items consumed by the recipe|

### ItemIcon
|Property|Type|Description|
|---|---|---|
|id|[GameId](#gameid)|The ID used by the game files to identify the icon|
|kind|[ItemIconKind](#itemiconkind)|The string representation of the icon; will be used in the future to identify asset files|
|colorId|[GameId](#gameid)|The ID used by the game files to identify the icon's color|
|color|[Color](#color)|The string representation of the icon's color|

### ItemIconKind
An enumerated value, one of the following:

|||||||
|---|---|---|---|---|---|
|ammo-basic|ammo-heavy|ammo-slug|ammo-special|ammo-utility|armor-sphere|
|barrel|binoculars|bone|bug|camping-kit|capture-net|
|certificate|claw|coin|cooking-cheese|cooking-egg|cooking-garlic|
|cooking-mushroom|cooking-shellfish|crystal|curative|drug|egg|
|extract|fishing-rod|fish|gem|grill|hide|
|honey|mantle|meat|medulla|mushroom|mystery-artian|
|mystery-decoration|mystery-material|nut|ore|phial|pill|
|plant|plate|poop|potion|powder|question|
|scale|seed|shell|skull|slinger-ammo|smoke|
|sprout|tail|trap|trap-tool|voucher|web|
|whetstone|wing|knife|||||

## List all items
```shell
curl "{{URL}}/en/items"
```

> Returns an array of [Item] objects.

```json
[
    {
        "rarity": 1,
        "name": "Potion",
        "description": "Restores a small amount of health.",
        "value": 8,
        "carryLimit": 10,
        "recipes": [
            {
                "output": {
                    "id": 1
                },
                "amount": 1,
                "inputs": [
                    {
                        "name": "Herb",
                        "id": 24
                    }
                ],
                "id": 67
            }
        ],
        "icon": {
            "id": 10,
            "kind": "potion",
            "colorId": 14,
            "color": "green"
        },
        "id": 1,
        "gameId": 2
    }
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

##### HTTP Request
`GET {{URL}}/{locale}/items`

## Retrieve an item
```shell
curl "{{URL}}/en/items/1"
```

> Returns a single [Item] object.

```json
{
    "rarity": 1,
    "name": "Potion",
    "description": "Restores a small amount of health.",
    "value": 8,
    "carryLimit": 10,
    "recipes": [
        {
            "output": {
                "id": 1
            },
            "amount": 1,
            "inputs": [
                {
                    "name": "Herb",
                    "id": 24
                }
            ],
            "id": 67
        }
    ],
    "icon": {
        "id": 10,
        "kind": "potion",
        "colorId": 14,
        "color": "green"
    },
    "id": 1,
    "gameId": 2
}

```

This endpoint retrieves an item by its ID.

##### HTTP Request
`GET {{URL}}/{locale}/items/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The item's ID|