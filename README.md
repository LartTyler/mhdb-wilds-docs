Static documentation generator, forked from [`slatedocs/slate`](https://github.com/slatedocs/slate).

Some adjustments have been made to better fit the projects needs.

## Header linking and nesting
Headers will nest in the table of contents up to H3 (based on the guide found
[here](https://github.com/slatedocs/slate/wiki/Deeper-Nesting#static-table-of-contents)).

Additionally, the `NestingUniqueHeadCounter` renderer provided by Slate is being used, with some minor tweaks.
- Header IDs only append a prefix if the header has been seen before.
- Header IDs only prefix the top-level header ID, not all headers in their ancestry.

This means that, given the structure:

```md
# First
## Child

# Second
## Chilld
```

The following header IDs would be generated.

```md
#first
    #child

#second
    #second-child
```

The sole exception to this rule is the "Property" header. Since this header is used in every endpoint group, it will
_always_ be prefixed with the top-level header ID, even the first time it is encountered.