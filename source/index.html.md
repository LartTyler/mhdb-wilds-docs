---
title: "Monster Hunter: {{TITLE}} API Reference"

language_tabs: # must be one of https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers
  - shell: cURL

toc_footers:
  - <a href="https://github.com/LartTyler/mhdb-{{ID}}">Visit the project on Github</a>
  - <a href="https://discord.gg/6GEHHQh">Join us on Discord</a>
  - <script type='text/javascript' src='https://storage.ko-fi.com/cdn/widget/Widget_2.js'></script><script type='text/javascript'>kofiwidget2.init('Support us on Ko-fi', '#72a4f2', 'E1E41BOLDX');kofiwidget2.draw();</script>

includes:
  - endpoints_ailments
  - endpoints_armor
  - endpoints_armor_sets
  - endpoints_charms
  - endpoints_decorations
  - endpoints_items
  - endpoints_locations
  - endpoints_monsters
  - endpoints_motion_values
  - endpoints_skills
  - endpoints_weapons
  - data_types
  - searching
  - projecting
  - errors

search: true

code_clipboard: true

meta:
  -
    name: description
    content: "Documentation for the unofficial Monster Hunter: {{TITLE}} API"
---

# Introduction
<aside class="notice">
  This API is a work in progress. Some endpoints do not yet contain data, and will simply return an empty
  JSON array or object (depending on the endpoint).<br><br>

  Currently, the following objects have been fully populated into the API:<br>
  <ul>
    <li><a href="#armor">Armor</a></li>
    <li><a href="#armor-sets">Armor Sets</a></li>
    <li><a href="#charms">Charms</a></li>
    <li><a href="#decorations">Decorations</a></li>
    <li><a href="#items">Items</a></li>
    <li><a href="#skills">Skills</a></li>
    <li><a href="#weapons">Weapons</a></li>
    <li><a href="#monsters">Monsters</a></li>
    <li><a href="#locations">Locations</a></li>
  </ul>

  Want to help get more data into the API? <a href="https://discord.gg/6GEHHQh">Join us on Discord</a>! Deciphering the
  game files and building the importers needed to populate the API is time consuming, and assistance is always welcome.
</aside>

Welcome to the API documentation for [{{URL}}]({{URL}}).

Questions, comments, concerns, complaints? [Join us on Discord!](https://discord.gg/6GEHHQh)

## Accessing the API
The API can be accessed using the base URL `{{URL}}/{locale}`, where `{locale}` is an
[ISO 639-1](https://en.wikipedia.org/wiki/ISO_639-1) language code. For example, to access the API in English, you would
use the base URL `{{URL}}/en`.

Note that only the values of certain text fields are localized, not the field names themselves. Additionally, certain
enumerated values (such as [weapon type](#weaponkind)) are not localized.

~~Some fields may not have localized values for every language. If a field has not been localized for your specified
language, the value will be `null` instead.~~

Since we are now exclusively using data from the game files, all languages supported by Wilds should be translated in
the API. If you find something that isn't, please let us know!

### Controlling Response Fields
All endpoints support a `p` query parameter that can be used to control which fields are included in the response
from the API. Read the [Projecting Results](#projecting-results) section for more information.

### Filtering Objects in the Response
All list endpoints support a `q` query parameter that can be used to filter items in the response from the API. A
"list endpoint" is usually a `GET` request to the top-level path hierarchy, e.g. `GET /items`, but endpoints that
support filtering will indicate that they fall into this category. Read the [Searching the API](#searching-the-api)
section for more information.

Such endpoints also support two additional query parameters, `limit` and `offset`, which can be used to paginate
results from the API. The `limit` parameter indicates that maximum number of elements that should be included in the
response, and `offset` is a zero-based index to begin including results from. For example:

`GET {{URL}}/en/items?limit=10&offset=0`

This would return 10 [Items](#items) from the API, beginning at the first element. To move to the second page, you can
simply increase `offset` by the number of elements in each page, like so:

`GET {{URL}}/en/items?limit=10&offset=10`

### Caching
All `GET` requests to the API are cached by Cloudflare, and will include relevant cache headers. This means that while
some requests may be slow for large responses when they are first requested (such as retrieving
[all armor pieces](#list-all-armor)), subsequent requests to the endpoint will be very fast.

Additionally, you can optimize your application further by implementing local caching. Simply include the
[`If-Modified-Since`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Modified-Since) HTTP header; the
server will respond with a `304 Not Modified` response if your locally cached data is up-to-date.

### Stub Objects
```json
{
    "name": "Dragon Resistance",
    "kind": "armor",
    "description": "Increases dragon resistance. Also improves defense at higher levels.",
    "ranks": [
        {
            "skill": {
                "id": 1
            },
            "level": 1,
            "description": "Dragon resistance +6",
            "id": 1
        },
        [...]
    ],
    "id": 1,
    "gameId": -2125233152
}
```

You may notice that the API sometimes returns fields that are not included in this document. In most cases, these are
"stub objects", references to a parent object that is included to make it easier to work with the API, but can probably
be ignored in many cases. For example, consider the response on the right from the `/skills` endpoint.

In the first entry of the `ranks` array, there is a `skill` field, which contains only an ID. This will always match
the ID of the `Skill` that owns the `SkillRank`, and will be present on all instances of `SkillRank`. This could be
useful if your application passes a `SkillRank` entry to a function that still needs to know the ID of the skill it
belongs to. In other cases, child objects may not have their own unique IDs, and the parent's ID may be used instead.

Any object that is a child of another object will have this stub version of its parent. In most cases, only the parent's
ID will be included, but in certain special cases more information may also be included, such as the parent's name
field.

## Reading this document
All example URLs use the `en` locale (e.g. "{{URL}}/**en**/items"), but your application can use any valid language code.

Some examples have their properties truncated to save space. Any time you see "[...]", this indicates that the example
has been truncated, but there would normally be much more data present in the response.

## Versioning
```json
{
  "version": "2025-04-18T03:29:46+00:00"
}
```
> A sample `Version` response.

The API provides a `/version` endpoint that responds with the timestamp that the importers last ran. This, effectively,
serves as a "version" for the API: as long as your cached data is newer than the timestamp, your local data is
up-to-date. If it is not, some or all of your local data may be out of sync.

This can be used for long-term storage of cached data, separate from the [caching behavior](#caching) that is
implemented for the entire API through Cloudflare.

##### HTTP Request
`GET {{URL}}/version`

Note that unlike other endpoints in the API, this endpoint does not support a `{{locale}}` parameter.

## Deprecations
When an object, property, or feature is being phased out, a best-effort attempt will be made to ensure that the field
remains for at least a short period of time, to give API consumers a chance to replace the feature with something else.
The [section below](#schedule) lists features that are currently deprecated, along with their replacement (if there is
one), and approximately when the deprecated feature will be removed completely. The standard removal window is 2 weeks
from the release that deprecated the feature.

Dates listed in the deprecation schedule indicate the _earliest_ that a feature will be removed. Often, removal of
deprecations will be bundled with other updates, and it may take longer than the specified date to fully remove the
feature.

Additionally, please be aware that it is not always possible to cleanly deprecate a feature. Every attempt will be made
to do so, but sometimes it just isn't possible. In such cases, an announcement will be made ahead of time in the
[Discord server](https://discord.gg/6GEHHQh) with an estimate of when the feature will be removed.

### Schedule
|Feature|Removal Date|Replacement|More Info|
|---|---|---|---|
|`Monster.breakableParts`|2025-06-24|[`Monster.parts`](#monsters-properties)|[Link](#deprecation-monster-breakableparts)|

#### Deprecation: `Monster.breakableParts`
This feature was added without much consideration behind it. The name is confusing, and the objects inside the array
aren't what you might assume at first glance.

This field has only ever contained parts that can be broken, _and that also_ have an entry in the reward table. For
example, Rathian only listed two parts in this field (both wings), because those were the only two parts with drop
table entries. You _can_ break Rathian's head, but since the drop table didn't include it, it wasn't included in this
array.

The replacement, [`Monster.parts`](#monsters-properties), includes _all_ parts, like you'd expect. Additionally, since
the parts list is now being pulled from the actual part data file, and not just inferred from the drop tables, more data
like base health, damage type modifiers, and kinsect essence can be included.