# Searching the API
```shell
curl '{{URL}}/en/items?q={"value":{"$gte":1000}}'
```

> Only items with a sell value of at least 1000 will be included in the array returned from the API.

```json
[
    {
        "id": 91,
        "rarity": 5,
        "carryLimit": 1,
        "value": 3600,
        "name": "Powercharm",
        "description": "An amulet that [...]."
    },
    {
        "id": 92,
        "rarity": 5,
        "carryLimit": 1,
        "value": 6840,
        "name": "Powertalon",
        "description": "A charm that [...]"
    },
    [...]
]
```

Any endpoint that returns an array can be searched by passing a `q` parameter in the URL, e.g. `/items?q={...}`. The
value of `q` should be a MongoDB-style [query document](https://www.mongodb.com/docs/manual/tutorial/query-documents/).
If you are not familiar with MongoDB query documents, and short explanation can be found below.

## Query Document
```json
{
    "name": "Poison Resistance"
}
```
> A simple query document, searching for any object whose `name` field is equal to "Poison Resistance".

A query document is simply a JSON object that defines fields and values to search by. In the example to the right, the
query would cause the API to only include objects where the `name` field was exactly equal to "Poison Resistance".


## Operators
```json
{
    "defense.base": {
        "$gt": 50
    }
}
```

You can perform more complex searches by utilizing _operators_. You can find a full list of supported operators
[here](https://github.com/LartTyler/doctrine-query-document#built-in-operators).

In the example to the right, the greater-than operator (`$gt`) is being used to only return objects whose base defense
value is greater than 50. Note that nested fields can be specified by using dot-notation.