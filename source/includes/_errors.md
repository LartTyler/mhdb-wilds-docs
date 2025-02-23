# Errors
```json
{
    "error": {
        "code": "category.subtype",
        "message": "A verbose, human-readable error message."
    }
}
```

Any response with a status code outside the 200 range will, in almost every case, include an object that describes
the error in the response body. Every type of error response follows the same format.

Error respones will always have, at minimum, an `error` key containing the error object, as can be seen in the example
to the right. Within that object, the `code` key acts like an identifier; it will always be the same for the same class
of error, and can be used for error handling in your code. The `message` key is a human-friendly description of the
error, and may change slightly depending on the error conditions.

## Error Codes
|Code|Description|
|---|---|
|`not_found`|No object could be found with the ID provided|
|`query_document.invalid_query`|The query document provided has a typo or syntax error|
|`query_document.invalid_projection`|The projection provided has a typo or syntax error|