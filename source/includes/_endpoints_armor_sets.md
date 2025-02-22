[ArmorSet]: #armor-sets

# Armor Sets
### Properties
|Property|Type|Description|
|---|---|---|
|id|Integer|The armor set's ID|
|name|String|The armor set's name|
|pieces|Array<[Armor](#armor)>|An array of armor pieces belonging to the armor set|
|bonus|[ArmorSetBonus](#armorsetbonus)|An array of bonuses given by the set when a certain number of pieces are worn|

### ArmorSetBonus
|Property|Type|Description|
|---|---|---|
|id|Integer|The bonus's ID|
|name|String|The name of the armor set bonus|
|ranks|Array<[ArmorSetBonusRank](#armorsetbonusrank)>|The different ranks of the bonus|

### ArmorSetBonusRank
|Property|Type|Description|
|---|---|---|
|id|Integer|The rank's ID|
|pieces|Integer|The number of armor pieces from the set that must be worn to activate the bonus|
|skill|[SkillRank](#skillrank)|The skill granted by this rank of the bonus|