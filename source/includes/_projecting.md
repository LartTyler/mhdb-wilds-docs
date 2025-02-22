# Projecting Results
```shell
curl '{{URL}}/en/items?p={"id": true, "name":true}'
```

> The response from the API will only include the `id` and `name` field.

```json
[
    {
        "id": 1,
        "name": "Potion"
    },
    {
        "id": 2,
        "name": "Mega Potion"
    }
]
```

You can specify which fields the API should return, called "projecting", by providing the `p` query parameter.

The value of `p` should be a JSON object whose key is the field path to project, and the value is a boolean indicating
if that field should be included in the response.

Paths should be a dot-notation identifier for the field. For example, weapons have a `crafting` field, which contains a
`craftingMaterials` property. The dot-notation form would be `crafting.craftingMaterials`.

Note that projections will silently ignore unrecognized field names.