[Location]: #locations

# Locations
|Property|Type|Description|
|---|---|---|
|id|Integer|The location's ID|
|name|String|The location's name|
|zoneCount|Integer|The number of zones in the location|
|camps|Array<[Camp](#camp)>|An array of camps in the location|

### Camp
|Property|Type|Description|
|---|---|---|
|id|Integer|The camp's ID|
|name|String|The camp's name|
|zone|Integer|Which zone the camp is located in|

## List all locations
```shell
curl "{{URL}}/en/locations"
```

> Returns an array of [Location] objects.

```json
[
    {
        "id": 1,
        "zoneCount": 17,
        "name": "Ancient Forest",
        "camps": [
            {
                "id": 26,
                "zone": 1,
                "name": "Southwest Camp"
            },
            [...]
        ]
    }
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

### HTTP Request
`GET {{URL}}/{locale}/locations`

## Retrieve a location
```shell
curl "{{URL}}/en/locations/1"
```

> Returns a single [Location] object.

```json
{
    "id": 1,
    "zoneCount": 17,
    "name": "Ancient Forest",
    "camps": [
        {
            "id": 26,
            "zone": 1,
            "name": "Southwest Camp"
        },
        [...]
    ]
}
```

### HTTP Request
`GET {{URL}}/{locale}/locations/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The location's ID|