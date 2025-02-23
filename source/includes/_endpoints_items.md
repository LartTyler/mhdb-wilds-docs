[Item]: #items

# Items
|Property|Type|Description|
|---|---|---|
|id|Integer|The item's ID|
|name|String|The item's name|
|description|String|The item's description|
|rarity|Integer|The item's rarity|
|carryLimit|Integer|The maximum number of the item that can be carried at once|
|value|Integer|The value of the item when sold to a vendor|

## List all items
```shell
curl "{{URL}}/en/items"
```

> Returns an array of [Item] objects.

```json
[
    {
        "id": 1,
        "rarity": 1,
        "carryLimit": 10,
        "value": 8,
        "name": "Potion",
        "description": "Restores a small amount of health."
    }
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

### HTTP Request
`GET {{URL}}/{locale}/items`

## Retrieve an item
```shell
curl "{{URL}}/en/items/1"
```

> Returns a single [Item] object.

```json
{
    "id": 1,
    "rarity": 1,
    "carryLimit": 10,
    "value": 8,
    "name": "Potion",
    "description": "Restores a small amount of health."
}
```

This endpoint retrieves an item by its ID.

### HTTP Request
`GET {{URL}}/{locale}/items/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The item's ID|