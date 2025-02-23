[MotionValue]: #motion-values

# Motion Values
|Property|Type|Description|
|---|---|---|
|id|Integer|The motion value's ID|
|name|String|The motion value's name|
|weapon|[WeaponKind](#weaponkind)|The type of weapon this motion value applies to|
|damage|[DamageKind](#damagekind)|The type of damage dealt by the attack|
|stun|Percent|The amount of stun damage dealt by the attack|
|exhaust|Percent|The amount of exhaust damage dealt by the attack|
|hits|Array&lt;Percent>|An array indicating the number of times the attack hits, and what percentage of weapon damage is dealt by each hit|

## List all motion values
```shell
curl "{{URL}}/en/motion-values"
```

> Returns an array of [MotionValue] objects.

```json
[
    {
        "id": 119,
        "weapon": "hammer",
        "damage": "blunt",
        "stun": null,
        "exhaust": 40,
        "hits": [
            15,
            76
        ],
        "name": "Charged Big Bang"
    },
    [...]
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

### HTTP Request
`GET {{URL}}/{locale}/motion-values`

## List all motion values by weapon
```shell
curl -G "{{URL}}/en/motion-values" --data-urlencode 'q={"weapon": "hammer"}'
```

> Returns a list of [MotionValue] objects for the Hammer.

```json
[
    {
        "id": 119,
        "weapon": "hammer",
        "damage": "blunt",
        "stun": null,
        "exhaust": 40,
        "hits": [
            15,
            76
        ],
        "name": "Charged Big Bang"
    },
    [...]
]
```

This is a list endpoint, and supports [filtering](#filtering-objects-in-the-response).

### HTTP Request
`GET {{URL}}/{locale}/motion-values?q={"weapon": "{type}"}`

|Parameter|Type|Description|
|---|---|---|
|type|[WeaponKind](#weaponkind)|The type of weapon to search for|

## Retrieve a motion value
```shell
curl "{{URL}}/en/motion-values/119
```

> Returns a single [MotionValue] object.

```json
{
    "id": 119,
    "weapon": "hammer",
    "damage": "blunt",
    "stun": null,
    "exhaust": 40,
    "hits": [
        15,
        76
    ],
    "name": "Charged Big Bang"
}
```

### HTTP Request
`GET {{URL}}/{locale}/motion-values/{id}`

|Parameter|Type|Description|
|---|---|---|
|id|Integer|The motion value's ID|
