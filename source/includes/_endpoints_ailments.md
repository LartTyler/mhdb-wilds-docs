[Ailment]: #ailments
[Item]: #items
[Skill]: #skills
[Projecting Results]: #projecting-results
[Searching the API]: #searching-the-api

# Ailments
```json
{
    "id": 1,
    "name": "Blastblight",
    "description": "Blastblight will cause a [...]",
    "recovery": {
        "actions": [
            "dodge"
        ],
        "items": []
    },
    "protection": {
        "items": [],
        "skills": [
            {
                "id": 6,
                "name": "Blast Resistance",
                "description": "Grants protection against blastblight."
            }
        ]
    }
}
```

### Properties
|Property|Type|Description|
|---|---|---|
|id|Integer|The ID of the ailment|
|name|String|The name of the ailment|
|recovery|[Recovery](#recovery)|An object describing methods to remove the ailment|
|protection|[Protection](#protection)|An object describing the methods to mitigate or prevent the ailment|

### Recovery
|Property|Type|Description|
|---|---|---|
|actions|Array<String>|An array of actions, such as "dodge" or "roll", that will remove the ailment|
|items|Array<[Item]>|An arry of items that can remove the ailment|

### Protection
|Property|Type|Description|
|---|---|---|
|items|Array<[Item]>|An array of items that can mitigate or prevent the ailment|
|skills|Array<[Skill]>|An array of skills that can mitigate or prevent the ailment|

## List all ailments
```shell
curl "{{URL}}/en/ailments"
```

> Returns an array of [Ailment] objects.

```json
[
    {
        "id": 1,
        "name": "Blastblight",
        "description": "Blastblight will cause a [...]",
        "recovery": {
            "actions": [
                "dodge"
            ],
            "items": []
        },
        "protection": {
            "items": [],
            "skills": [
                {
                    "id": 6,
                    "name": "Blast Resistance",
                    "description": "Grants protection against blastblight."
                }
            ]
        }
    },
    [...]
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

### HTTP Request
`GET {{URL}}/{locale}/ailments`

## Retrieve an ailment
```shell
curl "{{URL}}/en/ailments/1"
```

> Returns a single [Ailment] object.

```json
{
    "id": 1,
    "name": "Blastblight",
    "description": "Blastblight will cause a [...]",
    "recovery": {
        "actions": [
            "dodge"
        ],
        "items": []
    },
    "protection": {
        "items": [],
        "skills": [
            {
                "id": 6,
                "name": "Blast Resistance",
                "description": "Grants protection against blastblight."
            }
        ]
    }
}
```

This endpoint retrieves a single ailment by its ID.

### HTTP Request
`GET {{URL}}/en/ailments/<id>`

### URL Parameters
|Parameter|Type|Description|
|---|---|---|
|id|Integer|The ailment's ID|