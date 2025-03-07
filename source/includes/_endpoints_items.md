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

### ItemRecipe
|Property|Type|Description|
|---|---|---|
|id|Integer|The ID of the recipe|
|amount|Integer|The number of items produced by the recipe|
|inputs|Array<[Item](#items)>|An array of items consumed by the recipe|

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
                "id": 1
            }
        ],
        "id": 1,
        "gameId": 2
    }
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

#### HTTP Request
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
            "id": 1
        }
    ],
    "id": 1,
    "gameId": 2
}
```

This endpoint retrieves an item by its ID.

#### HTTP Request
`GET {{URL}}/{locale}/items/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The item's ID|