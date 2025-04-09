[Location]: #locations

# Locations
## Properties
|Property|Type|Description|
|---|---|---|
|id|Integer|The location's ID|
|gameId|[GameId](#gameid)|The ID used by the game files to identify this location|
|name|String|The location's name|
|zoneCount|Integer|The number of zones in the location|
|camps|Array<[Camp](#camp)>|An array of camps in the location|

### Camp
|Property|Type|Description|
|---|---|---|
|id|Integer|The camp's ID|
|name|String|The camp's name|
|zone|Integer|Which zone the camp is located in|
|floot|Integer|Which floor of the map the camp is located on|
|risk|[Risk](#risk)|How likely the camp is to be found by a monster|
|position|[Position](#position)|The map coordinates that the camp is located at|

#### Risk
An enumerated value, one of the following:

||||
|-|-|-|
|safe|insecure|dangerous|

## List all locations
```shell
curl "{{URL}}/en/locations"
```

> Returns an array of [Location] objects.

```json
[
    {
        "name": "Oilwell Basin",
        "zoneCount": 18,
        "camps": [
            {
                "location": {
                    "id": 21
                },
                "name": "Area 2: Canyon Divide",
                "zone": 2,
                "floor": 2,
                "risk": "safe",
                "position": {
                    "x": 728.9807,
                    "y": -37.6587,
                    "z": -77.59798
                },
                "id": 153,
                "gameId": 1236020352
            },
            [...]
        ],
        "id": 21,
        "gameId": -1251081216
    }
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

##### HTTP Request
`GET {{URL}}/{locale}/locations`

## Retrieve a location
```shell
curl "{{URL}}/en/locations/1"
```

> Returns a single [Location] object.

```json
{
    "name": "Oilwell Basin",
    "zoneCount": 18,
    "camps": [
        {
            "location": {
                "id": 21
            },
            "name": "Area 2: Canyon Divide",
            "zone": 2,
            "floor": 2,
            "risk": "safe",
            "position": {
                "x": 728.9807,
                "y": -37.6587,
                "z": -77.59798
            },
            "id": 153,
            "gameId": 1236020352
        },
        [...]
    ],
    "id": 21,
    "gameId": -1251081216
}
```

##### HTTP Request
`GET {{URL}}/{locale}/locations/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The location's ID|